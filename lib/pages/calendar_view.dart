import 'package:crop_planning_techm/Models/TaskModels/task_model.dart';
import 'package:crop_planning_techm/pages/add_task.dart';
import 'package:crop_planning_techm/pages/task_details.dart';
import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarViewPage extends StatefulWidget {
  @override
  _CalendarViewPageState createState() => _CalendarViewPageState();
}

class _CalendarViewPageState extends State<CalendarViewPage> {
  CalendarController _controller;

  String selectedCalendarDate = '';
  DateTime _jumpToTime = DateTime.now();
  Color headerColor, viewHeaderColor, calendarColor, defaultColor;
  String _headerText;

  @override
  void initState() {
    _getTask();
    _headerText = 'header';

    _controller = CalendarController();
    _controller.view = CalendarView.month;
    // selectedCalendarDate = DateFormat('MMMM yyyy').format(_jumpToTime).toString();
    super.initState();
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    setState(() {
      if (_controller.view == CalendarView.month) {
        _controller.view = CalendarView.day;
      } else {
        if (calendarTapDetails.appointments != null &&
            calendarTapDetails.appointments.length == 1) {
          final Meeting meetingDetails = calendarTapDetails.appointments[0];
          String _meetingSubject = meetingDetails.eventName == '(No title)'
              ? ""
              : meetingDetails.eventName;
          String _startDate = meetingDetails.from.toString();
          String _endDate = meetingDetails.to.toString();
          Color _taskColor = meetingDetails.background;

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskDetails(
                        taskTitle: _meetingSubject,
                        startDate: _startDate,
                        endDate: _endDate,
                        taskColor: _taskColor,
                      )));
        }
        _pushToAddTaskPage(calendarTapDetails);
      }
    });
  }

  _pushToAddTaskPage(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.header) {
      selectedCalendarDate =
          DateFormat('MMMM yyyy').format(details.date).toString();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddTask(
                    selectedCalendarDate: selectedCalendarDate,
                  )));
    } else if (details.targetElement == CalendarElement.viewHeader) {
      selectedCalendarDate =
          DateFormat('yyyy-MM-dd').format(details.date).toString();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddTask(
                    selectedCalendarDate: selectedCalendarDate,
                  )));
    } else if (details.targetElement == CalendarElement.calendarCell) {
      selectedCalendarDate =
          DateFormat('yyyy-MM-dd').format(details.date).toString();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddTask(
                    selectedCropID: 404,
                    selectedCalendarDate: selectedCalendarDate,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_headerText),
      ),
      body: SafeArea(
        child: SfCalendar(
          onViewChanged: (ViewChangedDetails viewChangedDetails) {
            if (_controller.view == CalendarView.month) {
              _headerText = DateFormat('MMMM yyyy')
                  .format(viewChangedDetails.visibleDates[
                      viewChangedDetails.visibleDates.length ~/ 2])
                  .toString();
            }
            SchedulerBinding.instance.addPostFrameCallback((duration) {
              setState(() {});
            });
          },
          onTap: calendarTapped,
          controller: _controller,
          headerHeight: 0,
          viewHeaderHeight: -1,
          allowedViews: <CalendarView>[
            CalendarView.month,
            CalendarView.day,
            CalendarView.schedule,
            CalendarView.week,
          ],
          todayTextStyle: TextStyle(fontSize: 20),
          headerStyle: CalendarHeaderStyle(
              backgroundColor: Theme.of(context).primaryColor,
              textAlign: TextAlign.start,
              textStyle: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Colors.white, fontSize: 24)),
          viewHeaderStyle: ViewHeaderStyle(
              dayTextStyle: Theme.of(context).textTheme.headline4,
              dateTextStyle: TextStyle(color: Colors.grey, fontSize: 24)),
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              monthCellStyle: MonthCellStyle(
                textStyle: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.black54),
              ),
              showTrailingAndLeadingDates: true,
              dayFormat: "EEE",
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: false),
        ),
      ),
    );
  }

  List<TaskModel> tasks = [];
  _getTask() async {
    final dbHelper = TaskDBHelper.instance;
    List<TaskModel> fetchTasks = [];
    fetchTasks = await dbHelper.fetchTask();
    setState(() {
      tasks = fetchTasks;
    });

    print(tasks[0].priority);
  }

  List<Meeting> _getDataSource() {
    // print("inDataSource");
    // print(tasks);

    List meetings = <Meeting>[];

    List<Color> colourList = [
      Colors.blue,
      Colors.yellow,
      Colors.red,
      Colors.green,
      Colors.deepOrange
    ];
    //
    for (TaskModel task in tasks) {
      String startDateString = task.startDate + " " + task.startTime;
      DateTime formatedStartDate =
          DateFormat("yyyy-MM-dd kk:mm").parse(startDateString);

      String endDteString = task.endDate + " " + task.endTime;
      DateTime formatedEndDate =
          DateFormat("yyyy-MM-dd kk:mm").parse(endDteString);

      meetings.add(Meeting(
          task.mainTask + ":- " + task.subTask,
          DateTime(
              formatedStartDate.year.toInt(),
              formatedStartDate.month.toInt(),
              formatedStartDate.day.toInt(),
              formatedStartDate.hour.toInt(),
              formatedStartDate.minute.toInt()),
          DateTime(
              formatedEndDate.year.toInt(),
              formatedEndDate.month.toInt(),
              formatedEndDate.day.toInt(),
              formatedEndDate.hour.toInt(),
              formatedEndDate.minute.toInt()),
          colourList[task.taskColor],
          false));
    }

    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
