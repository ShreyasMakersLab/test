import 'package:crop_planning_techm/pages/choose_crops.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///E:/Flutter_projects/crop_planning_techm/lib/widgets/image_picker.dart';

class FarmDetails extends StatefulWidget {
  @override
  _FarmDetailsState createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController farmController;
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter farm name";
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                controller: farmController,
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
                                                .validate()) {}
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
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: Image.network(
                                  'https://images.unsplash.com/photo-1499529112087-3cb3b73cec95?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8ZmFybXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
                              .image,
                        ),
                        title: Text(
                          'Farm 1',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        subtitle: Text('30 Acres'),
                      ),
                      // Divider(
                      //   thickness: 1,
                      // ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: Image.network(
                            'https://images.unsplash.com/photo-1560493676-04071c5f467b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFybXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                            fit: BoxFit.fill,
                          ).image,
                        ),
                        title: Text(
                          'Farm 2',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        subtitle: Text('20 Acres'),
                      ),
                    ],
                  ),
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
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CropDetails()),
              );
            }
          },
        ),
      ),
    );
  }
}
