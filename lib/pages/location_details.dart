import 'package:crop_planning_techm/pages/farmdetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationDetails extends StatefulWidget {
  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusnode;
  TextEditingController _stateController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _divisionController = TextEditingController();
  TextEditingController _villageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myFocusnode = FocusNode();
  }

  @override
  void dispose() {
    myFocusnode.dispose();
    _stateController.dispose();
    _districtController.dispose();
    _divisionController.dispose();
    _villageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Location Details",
            style: Theme.of(context).appBarTheme.textTheme.headline1),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _stateController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please select your state";
                          }
                          return null;
                        },
                        // onFieldSubmitted: (value) {
                        //   if (_formKey.currentState.validate()) {}
                        // },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelStyle: TextStyle(fontSize: 18),
                          labelText: 'State',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _districtController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please select your district";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelStyle: TextStyle(

                              // color: Colors.black38,

                              fontSize: 18),
                          labelText: 'District',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _divisionController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please select your division";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelStyle: TextStyle(

                              // color: Colors.black38,

                              fontSize: 18),
                          labelText: 'Division',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _villageController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please select your village";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          labelStyle: TextStyle(

                              // color: Colors.black38,

                              fontSize: 18),
                          labelText: 'Village',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
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
            _setLocationDetails();
            if (_formKey.currentState.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FarmDetails()),
              );
            }
          },
        ),
      ),
    );
  }

  _setLocationDetails() async {
    try {
      /// Checks if shared preference exist
      print("Shared Preference in Location Page");
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      setState(() {
        prefs.setString('state', _stateController.text);
        prefs.setString('district', _districtController.text);
        prefs.setString('division', _divisionController.text);
        prefs.setString('village', _villageController.text);
      });
    } catch (err) {
      /// setMockInitialValues initiates shared preference

      SharedPreferences.setMockInitialValues({});
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      setState(() {
        prefs.setString('state', _stateController.text);
        prefs.setString('district', _districtController.text);
        prefs.setString('division', _divisionController.text);
        prefs.setString('village', _villageController.text);
      });
    }

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String _res = prefs.getString("state");
    String _res2 = prefs.getString("district");
    String _res3 = prefs.getString("village");

    print(_res + " " + _res2 + " " + _res3);
  }
}
