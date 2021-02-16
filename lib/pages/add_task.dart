import 'package:crop_planning_techm/widgets/adjust_fab.dart';
import 'package:crop_planning_techm/widgets/no_scaling_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          padding: EdgeInsets.all(14),
          child: Text(
            'ADD TASK',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          color: Colors.green,
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation:
          FixedCenterDockedFabLocation(context: context),
      floatingActionButtonAnimator: NoScalingAnimation(),
      appBar: AppBar(
        title: Text(
          "Add Task",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 4,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 24),
                          labelText: "Add Title",
                          labelStyle:
                              Theme.of(context).textTheme.headline4.copyWith(
                                    fontSize: 28,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Text(
                            "Color:",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.circle,
                              color: Colors.yellow,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.circle,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.circle,
                              color: Colors.blue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.circle,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.circle,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "Start Date:",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Mon, 28 9:00 PM",
                                suffixIcon: Icon(
                                  Icons.date_range,
                                  size: 32,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 28),
                            child: Text(
                              "End Date:",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.date_range,
                                  size: 32,
                                ),
                                hintText: "Mon, 28 9:00 PM",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      TextFormField(
                        minLines: 1,
                        maxLines: 4,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Notes about task...",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
