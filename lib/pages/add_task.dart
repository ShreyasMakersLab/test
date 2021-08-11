import 'package:crop_planning_techm/Models/TaskModels/task_model.dart';
import 'package:crop_planning_techm/pages/calendar_view.dart';
import 'package:crop_planning_techm/services/notification_helper.dart';
import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:crop_planning_techm/widgets/taskDropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  final String selectedCalendarDate;
  final int selectedCropID;

  AddTask({this.selectedCalendarDate, this.selectedCropID});
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // final dbHelper = TaskDBHelper.instance;
  NotificationService notificationService = Get.put(NotificationService());
  List<TaskModel> mytask;
  DateTime selectedDate;
  DateTime todayDate = DateTime.now();
  bool highPriority = false;
  bool lowPriority = true;

  String _mainTask;
  String _subTask;
  String _startDate;
  String _startTime = "8:30 AM";
  String _endDate = "End Date";
  String _endTime = "9:30 AM";
  String _priority = "Low";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _startDate = widget.selectedCalendarDate;
    });
  }

  final titleController = TextEditingController();
  final descController = TextEditingController();
  int _taskColour = 0;

  updateTask(String newMaintask, String newSubTask) {
    setState(() {
      _mainTask = newMaintask;
      _subTask = newSubTask;
    });
    print(_mainTask + _subTask);
  }

  @override
  Widget build(BuildContext context) {
    print(todayDate);
    return Scaffold(
      bottomNavigationBar: Container(
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
          onPressed: () {
            notificationService.instantNofitication(
                title: _mainTask + ": " + _subTask,
                body: "You have successfully created task on ${_startDate}");

            DateTime _formatedStartDate = DateFormat("yyyy-MM-dd hh:mm a")
                .parse(_startDate + " " + _startTime);
            print("Date");
            print(_formatedStartDate);
            print(todayDate);

            if (_formatedStartDate.isAfter(DateTime.now())) {
              print("isAfter");
              notificationService.scheduledZonedNotification(
                  title: _mainTask + ": " + _subTask,
                  body: "Today you have scheduled task",
                  scheduleDate: _startDate + " " + _startTime);
            }

            _validateInputs();
          },
        ),
      ),
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
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    taskDropDown(
                      onTaskSet: (newMainTask, newSubTask) {
                        updateTask(newMainTask, newSubTask);
                      },
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: ActionChip(
                              pressElevation: 6,
                              labelPadding: EdgeInsets.all(4.0),
                              avatar: CircleAvatar(
                                backgroundColor: Colors.white70,
                                child: Text(
                                  "H",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              label: Text(
                                "High Priority",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: highPriority
                                  ? Colors.red
                                  : Colors.red.withOpacity(0.6),
                              elevation: 2.0,
                              shadowColor: Colors.grey[60],
                              padding: EdgeInsets.all(8.0),
                              onPressed: () {
                                setState(() {
                                  highPriority = true;
                                  lowPriority = false;
                                  _priority = "High";
                                });
                              },
                            ),
                          ),
                          ActionChip(
                            labelPadding: EdgeInsets.all(4.0),
                            avatar: CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: Text(
                                "L",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                            label: Text(
                              "Low Priority",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: lowPriority
                                ? Colors.orange
                                : Colors.orange.withOpacity(0.6),
                            elevation: 2.0,
                            shadowColor: Colors.grey[60],
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {
                              setState(() {
                                lowPriority = true;
                                highPriority = false;
                                _priority = "Low";
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "Color:",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          _colorBadge(),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      child: OutlinedButton(
                        // disabledBorderColor: Colors.black45,
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(color: Colors.black45),
                        ),

                        onPressed: () => _selectDate(context, "_startDate"),
                        // {
                        //   setState(() {
                        //     _startTime = _selectDate(context);
                        //   });
                        // Refer step 3
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${_startDate}",
                                style: Theme.of(context).textTheme.headline5),
                            Icon(
                              Icons.date_range,
                              color: Colors.black54,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      child: OutlinedButton(
                        // disabledBorderColor: Colors.black45,
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(color: Colors.black45),
                        ),
                        onPressed: () =>
                            _selectDate(context, "endDate"), // Refer step 3
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${_endDate}",
                                style: Theme.of(context).textTheme.headline5),
                            Icon(
                              Icons.date_range,
                              color: Colors.black54,
                            )
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Container(
                    //     margin: EdgeInsets.symmetric(
                    //         vertical: 12, horizontal: 12),
                    //     child: OutlinedButton(
                    //       // disabledBorderColor: Colors.black45,
                    //       style: OutlinedButton.styleFrom(
                    //         padding: EdgeInsets.all(16),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(18.0),
                    //         ),
                    //         side: BorderSide(color: Colors.black45),
                    //       ),
                    //       onPressed: () => _selectTime(
                    //           isStartTime: false), // Refer step 3
                    //       child: Row(
                    //         mainAxisAlignment:
                    //             MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text("${_endTime}",
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .headline5),
                    //           // Icon(
                    //           //   Icons.date_range,
                    //           //   color: Colors.black54,
                    //           // )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(16),
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
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: descController,
                        // minLines: 1,
                        // maxLines: 4,
                        // textInputAction: TextInputAction.newline,
                        // keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Notes about task...",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      // Column(
                      //
                      //   children: mytask
                      //       .map((task) => Text("${task.taskTitle}"))
                      //       .toList(),
                      // )
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

  _validateInputs() async {
    if (_mainTask != null && _subTask != null) {
      await _insertTaskToDB();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CalendarViewPage()),
      );
    } else if (_mainTask == null || _subTask == null) {
      final snackBar = SnackBar(
        content: Text("All fields are required."),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print("############ SOMETHING BAD HAPPENED #################");
    }
  }

  Future _insertTaskToDB() async {
    WidgetsFlutterBinding.ensureInitialized();

    TaskModel task = TaskModel(
      mainTask: _mainTask,
      subTask: _subTask,
      startDate: _startDate,
      startTime: _startTime,
      endDate: _endDate,
      endTime: _endTime,
      priority: _priority,
      selectedCropID: widget.selectedCropID,
      taskColor: _taskColour,
      taskStatus: "Created",
    );

    final dbHelper = TaskDBHelper.instance;

    final id = await dbHelper.insertTask(task);
    print('inserted row id: $id');
    print(dbHelper.fetchTask());
  }

  Future<DateTime> _selectDate(BuildContext context, String type) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: Theme.of(context).primaryColor,
            ),
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != DateTime.now())
      setState(() {
        type == "_startDate"
            ? _startDate = DateFormat('yyyy-MM-dd').format(picked).toString()
            : _endDate = DateFormat('yyyy-MM-dd').format(picked).toString();
      });
    // print(selectedDate.toString());
    // return selectedDate;

    // return selectedDate.toString();
  }

  _showTimePicker() async {
    return showTimePicker(
      initialTime: TimeOfDay(hour: 8, minute: 30),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }

  _selectTime({@required bool isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    print(_pickedTime.format(context));
    String _formatedTime = _pickedTime.format(context);
    print(_formatedTime);
    if (_pickedTime == null)
      print("time canceld");
    else if (isStartTime)
      setState(() {
        _startTime = _formatedTime;
      });
    else if (!isStartTime) {
      setState(() {
        _endTime = _formatedTime;
      });
      //_compareTime();
    }
  }

  List<Color> colourList = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.deepOrange
  ];

  _colorBadge() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        5,
        (int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _taskColour = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: index == 0
                    ? colourList[index]
                    : index == 1
                        ? colourList[index]
                        : index == 2
                            ? colourList[index]
                            : index == 3
                                ? colourList[index]
                                : colourList[index],
                child: index == _taskColour
                    ? Center(
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    : Container(),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
