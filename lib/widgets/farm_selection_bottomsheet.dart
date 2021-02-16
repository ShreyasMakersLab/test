import 'package:crop_planning_techm/pages/choose_crops.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dropdown.dart';
import 'date_picker.dart';

class SelectFarmBottomSheet extends StatefulWidget {
  @override
  _SelectFarmBottomSheetState createState() => _SelectFarmBottomSheetState();
}

class _SelectFarmBottomSheetState extends State<SelectFarmBottomSheet> {
  var _farmSize;
  TextEditingController farmController = new TextEditingController();

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

          // height: MediaQuery.of(context).size.height+20,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(

                    height: 8,
                    width: 64,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only( bottom: 8, left: 16,right: 16),
                      child: Text('Select Farms:',
                          style: Theme.of(context).textTheme.headline3),
                    ),
                    ListView(
                      padding: EdgeInsets.all(8),
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  _isVisible
                                      ? _isVisible = false
                                      : _isVisible = true;
                                });
                                print(_isVisible);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: Image.network(
                                        'https://images.unsplash.com/photo-1560493676-04071c5f467b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFybXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
                                    .image,
                              ),
                              title: Text("Farm 1 ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3),
                              subtitle: Text(
                                  _farmSize ?? "Total Size: 20 Acres",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4),
                              trailing: Icon(Icons.edit),
                            ),
                          ),
                        ),
                        Visibility(
                          maintainState: true,
                          visible: _isVisible,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border:
                                      Border.all(color: Color(0x33000000))),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Select Entire Farm",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3),
                                          Switch(
                                              value: false, onChanged: null)
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, bottom: 16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.number,
                                            controller: farmController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                              labelText:
                                                  "Enter Custom Farm Size",
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.all(8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                color: Theme.of(context).primaryColor,
                                              ),
                                              child: IconButton(
                                                  icon: Icon(
                                                      Icons.arrow_forward),
                                                  color: Colors.white,
                                                  onPressed: () {})),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: Image.network(
                              'https://images.unsplash.com/photo-1499529112087-3cb3b73cec95?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8ZmFybXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                              fit: BoxFit.fill,
                            ).image,
                          ),
                          title: Text('Farm 2',
                              style: Theme.of(context).textTheme.headline3),
                          subtitle: Text("Total Size: 30 Acres",
                              style: Theme.of(context).textTheme.headline4),
                          // subtitle: Text('20 Acres'),
                          trailing: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Divider(
                        thickness: 1,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Soil type",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    DropDownWidget(
                      titleText: "Select Soil Type",
                    ),
                    Text(
                      "Seed type",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    DropDownWidget(
                      titleText: "Select Seed type",
                    ),
                    Text(
                      "Expected Sowing Date",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    DatePickerWidget(hintDate: "Expected Sowing Date")
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Color(0xB3000000)),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CropDetails()));
                      },
                      child: Text("SELECT",
                          style: Theme.of(context).textTheme.headline2),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
