import 'package:flutter/material.dart';

class TaskDetails extends StatefulWidget {
  final String taskTitle;
  final String startDate;
  final String endDate;
  final Color taskColor;
  TaskDetails(
      {@required this.taskTitle,
      @required this.startDate,
      @required this.endDate,
      @required this.taskColor});
  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  Widget build(BuildContext context) {
    List<String> _mainTask = widget.taskTitle.split('-');

    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        backgroundColor: widget.taskColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _mainTask[0],
              style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: 28,
                  ),
            ),
            Text(
              _mainTask[1].trim(),
              style: Theme.of(context).textTheme.headline3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: Text(
                "Start Date: " + widget.startDate.trim().substring(10),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Text(
              "End Date: " + widget.endDate.trim(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
