import 'package:crop_planning_techm/pages/image_picker.dart';
import 'package:crop_planning_techm/pages/location_details.dart';
import 'package:crop_planning_techm/widgets/adjust_fab.dart';
import 'package:crop_planning_techm/widgets/date_picker.dart';
import 'package:crop_planning_techm/widgets/no_scaling_action.dart';
import 'package:flutter/material.dart';

enum Gender { Male, Female }

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Details",
            style: Theme.of(context).appBarTheme.textTheme.headline1),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImagePickerWidget(imagepickerpadding: 60),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(bottom: 70, left: 12, right: 12),
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
                            return "Please enter Text";
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
                    DatePickerWidget(hintDate: "Date Of Birth"),
                    GenderSelection()
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
                MaterialPageRoute(builder: (context) => LocationDetails()),
              );
            }
          },
        ),
      ),
    );
  }
}

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Gender _character = Gender.Male;
  @override
  Widget build(BuildContext context) {
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
