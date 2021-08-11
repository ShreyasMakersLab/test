import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef StringValue = String Function(String);

class DatePickerWidget extends StatefulWidget {
  var hintDate;
  final DatePickerMode datePickerMode;
  final StringValue onDateSet;
  DatePickerWidget(
      {this.hintDate, @required this.onDateSet, this.datePickerMode});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime initDate = DateTime.now();
  String selectedDate = "Enter DOB";
  // var formattedDate=widget.hintDate;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: initDate, // Refer step 1
      firstDate: DateTime(1949),
      lastDate: DateTime(2025),
      initialDatePickerMode: widget.datePickerMode ?? DatePickerMode.day,
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
    if (picked != null && picked != initDate)
      setState(() {
        selectedDate = picked.toString();
        // var date = DateTime.parse(selectedDate);
        // widget.hintDate = "${date.day}-${date.month}-${date.year}";
        widget.onDateSet(DateFormat('yyyy-MM-dd').format(picked).toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: OutlineButton(
        // disabledBorderColor: Colors.black45,
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        onPressed: () => _selectDate(context), // Refer step 3
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.hintDate, style: Theme.of(context).textTheme.headline5),
            Icon(
              Icons.date_range,
              color: Colors.black54,
            )
          ],
        ),
        borderSide: BorderSide(color: Colors.black45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
