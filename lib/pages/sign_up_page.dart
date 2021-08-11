import 'package:crop_planning_techm/pages/location_details.dart';
import 'package:crop_planning_techm/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Gender { Male, Female }

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();
  Gender _character = Gender.Male;
  String dateFromPicker;

  TextEditingController usernameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SharedPreferences prefs;
  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    // print(_character);
    return Scaffold(
      appBar: AppBar(
        title: Text("Create your account",
            style: Theme.of(context).appBarTheme.textTheme.headline1),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 40, bottom: 70, left: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text('Name',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    Container(
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          hintStyle:
                              TextStyle(color: Colors.black54, fontSize: 18),
                          hintText: 'Enter Your Name',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16, left: 8),
                      child: Text('DOB',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    DatePickerWidget(
                      hintDate: dateFromPicker == null
                          ? "Date Of Birth"
                          : dateFromPicker,
                      datePickerMode: DatePickerMode.year,
                      onDateSet: (String selectedDate) {
                        setState(() {
                          dateFromPicker = selectedDate;
                        });
                        return dateFromPicker;
                      },
                    ),
                    selectGender(),
                    Container(
                        margin: EdgeInsets.only(top: 16, left: 8, bottom: 8),
                        child: Text('Password',
                            style: Theme.of(context).textTheme.headline2)),
                    TextFormField(
                      controller: _passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintStyle:
                            TextStyle(color: Colors.black54, fontSize: 18),
                        hintText: 'Enter Password',
                      ),
                      validator: (value) {
                        if (!validateStructure(value)) {
                          return "Password must contain uppercase letter, lowercase letter,\nnumber and symbol";
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.black12,
                          )),
                      child: Text(
                        "Password must contain uppercase letter, lowercase letter, number and symbol",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.redAccent),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
            padding: MaterialStateProperty.all(
              EdgeInsets.all(14),
            ),
          ),
          child: Text(
            'NEXT',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            _setPersonalSDetails();
            if (_formKey.currentState.validate() && dateFromPicker != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationDetails()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("All fields are required!")));
            }
          },
        ),
      ),
    );
  }

  _setPersonalSDetails() async {
    try {
      /// Checks if shared preference exist
      print("Shared Preference in Personal_detail Page");
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      setState(() {
        prefs.setString('username', usernameController.text);
        prefs.setString('userDOB', dateFromPicker);
        prefs.setString('userGender', _character.toString());
        prefs.setString('password', _passwordController.text);
      });
    } catch (err) {
      /// setMockInitialValues initiates shared preference

      SharedPreferences.setMockInitialValues({});
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      setState(() {
        prefs.setString('username', usernameController.text);
        prefs.setString('userDOB', dateFromPicker);
        prefs.setString('userGender', _character.toString());
      });
    }
  }

  Widget selectGender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 16,
            left: 8,
          ),
          child: Text('Gender', style: Theme.of(context).textTheme.headline2),
        ),
        Row(
          children: <Widget>[
            Radio(
                value: Gender.Male,
                groupValue: _character,
                onChanged: (Gender value) {
                  setState(() {
                    _character = value;
                  });
                }),
            Text(
              'Male',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            Radio(
                value: Gender.Female,
                groupValue: _character,
                onChanged: (Gender value) {
                  setState(() {
                    _character = value;
                  });
                }),
            Text(
              'Female',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
