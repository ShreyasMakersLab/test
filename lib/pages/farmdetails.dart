import 'package:crop_planning_techm/Models/UserDataModels/farm_data.dart';
import 'package:crop_planning_techm/pages/choose_crops.dart';
import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///E:/Flutter_projects/crop_planning_techm/lib/widgets/image_picker.dart';

class FarmDetails extends StatefulWidget {
  @override
  _FarmDetailsState createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController farmNameController = TextEditingController();
  TextEditingController sizeController = TextEditingController();

  List<FarmModel> farms;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchFarmFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Farm Details',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 8,
            ),
            ImagePickerWidget(imagepickerpadding: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextFormField(
                          controller: farmNameController,
                          autovalidateMode: AutovalidateMode.disabled,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter farm name or farm location";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              labelText: 'Enter Farm Name'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                controller: sizeController,
                                autovalidateMode: AutovalidateMode.disabled,
                                validator: (value) {
                                  String patttern = r'(^[0-9]*$)';
                                  RegExp regExp = new RegExp(patttern);
                                  if (value.isEmpty) {
                                    return "Please enter farm size";
                                  } else if (!regExp.hasMatch(value)) {
                                    return "Farm size must be digits";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  labelText: "Enter Farm Size in Acres",
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            size: 30,
                                          ),
                                          color: Colors.white,
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _insertFarmToDB();
                                              _fetchFarmFromDB();

                                              FocusScope.of(context).unfocus();
                                              sizeController.clear();
                                              farmNameController.clear();
                                            }
                                            //   sizeController.clear();
                                            //   farmNameController.clear();
                                            //   FocusScope.of(context)
                                            //       .requestFocus(
                                            //           new FocusNode());
                                          }),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Your Farms:',
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  farms != null
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: farms.length,
                          itemBuilder: (BuildContext context, int i) {
                            return ListTile(
                              // leading:
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  farms[i]
                                      .farmName
                                      .substring(0, 2)
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              title: Text(
                                farms[i].farmName,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              subtitle:
                                  Text(farms[i].farmSize.toString() + " Acres"),
                            );
                          },
                          // Divider(
                          //   thickness: 1,
                          // ),
                        )
                      : Container(child: Text("No Farms")),
                ],
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            padding: EdgeInsets.all(14),
            child: Text(
              'NEXT',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CropDetails()),
              );
            }),
      ),
    );
  }

  _insertFarmToDB() async {
    WidgetsFlutterBinding.ensureInitialized();

    final taskDBHelper = TaskDBHelper.instance;

    FarmModel farm = FarmModel(
        farmName: farmNameController.text,
        farmSize: int.parse(sizeController.text));

    final _res = await taskDBHelper.insertFarm(farm);
    print("Farm inserted at ${_res}");
  }

  _fetchFarmFromDB() async {
    final taskDBHelper = TaskDBHelper.instance;

    List<FarmModel> _farms = await taskDBHelper.fetchFarms();
    setState(() {
      farms = _farms;
    });
  }
}
