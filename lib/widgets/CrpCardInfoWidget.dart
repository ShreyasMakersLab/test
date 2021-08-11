import 'package:crop_planning_techm/Models/TaskModels/task_model.dart';
import 'package:crop_planning_techm/Models/UserDataModels/crop_data.dart';
import 'package:crop_planning_techm/pages/add_task.dart';
import 'package:crop_planning_techm/pages/crop_profile.dart';
import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CropCard extends StatefulWidget {
  final CropModel cropData;

  CropCard({@required this.cropData});

  @override
  _CropCardState createState() => _CropCardState();
}

class _CropCardState extends State<CropCard> {
  List<TaskModel> tasksOfCrop = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchTasksOfCrop(widget.cropData.cropID,
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(Icons.schedule_rounded,
                        size: 28, color: Colors.black54),
                  ),
                  tasksOfCrop.isNotEmpty
                      ? taskOfCropWidget(
                          widget.cropData.cropID,
                          DateFormat('yyyy-MM-dd')
                              .format(DateTime.now())
                              .toString())
                      : Text("No Tasks Today",
                          style: Theme.of(context).textTheme.headline4)
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            cropCardInfo(
                context,
                "https://images.unsplash.com/photo-1506917728037-b6af01a7d403?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
                widget.cropData)
          ],
        ),
      ),
    );
  }

  _fetchTasksOfCrop(int cropID, String curDate) async {
    final db = TaskDBHelper.instance;

    List<TaskModel> task = await db.fetchTasksOfCrop(cropID, curDate);
    setState(() {
      tasksOfCrop = task;
    });
  }

  Widget taskOfCropWidget(int cropID, String curDate) {
    // _fetchTasksOfCrop(cropID, curDate);

    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Today's task is ",
            style: Theme.of(context).textTheme.headline4),
        TextSpan(
            text: tasksOfCrop[0].mainTask,
            style: Theme.of(context).textTheme.headline3)
      ]),
    );
  }
}

Widget cropCardInfo(
    BuildContext context, String crop_image_url, CropModel crop) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '${crop.cropName}\n',
                    style: Theme.of(context).textTheme.headline2),
                TextSpan(
                    text: '${crop.farmSelected}\n',
                    style: Theme.of(context).textTheme.headline4),
                TextSpan(
                    text:
                        'Sowing Date: ${DateFormat("EEE d, MMM-y").format(DateTime.parse(crop.sowingDate))}\n',
                    style: Theme.of(context).textTheme.headline4),
                TextSpan(
                    text: 'Farm Size: ${crop.farmSizeSelected}',
                    style: Theme.of(context).textTheme.headline4),
              ])),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image(
                    image: AssetImage('images/${crop.cropName}.jpg'),
                    fit: BoxFit.cover,
                  ),

                  // Image.network(
                  //   crop_image_url,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 16, right: 8),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddTask(
                                  selectedCalendarDate: "Start Date",
                                  selectedCropID: crop.cropID,
                                )));
                  },
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 24,
                          color: Colors.white,
                        ),
                        Text(
                          'Add Task',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 16, left: 8),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CropProfile()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black87,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 24,
                          color: Colors.black87,
                        ),
                        Text(
                          'Edit',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      )
    ],
  );
}
