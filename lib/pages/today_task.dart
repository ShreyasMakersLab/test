import 'package:crop_planning_techm/Models/TaskModels/task_model.dart';
import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:flutter/material.dart';

class TodaysTasks extends StatefulWidget {
  final String currDate;
  TodaysTasks({@required this.currDate});

  @override
  _TodaysTasksState createState() => _TodaysTasksState();
}

class _TodaysTasksState extends State<TodaysTasks> {
  List<TaskModel> tasks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchTodaysTask(widget.currDate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: tasks != null
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text("${tasks[i].mainTask}:- ${tasks[i].subTask}"),
                    leading: Icon(Icons.delete),
                  );
                })
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  _fetchTodaysTask(String date) async {
    final dbHelper = TaskDBHelper.instance;
    List<TaskModel> todayTask = await dbHelper.fetchTodaysTask(date);
    setState(() {
      tasks = todayTask;
    });
    print("currdate ${widget.currDate}");
    print(tasks[0].selectedCropID);
  }
}
