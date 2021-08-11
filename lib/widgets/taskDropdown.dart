import 'package:flutter/material.dart';

typedef void IntCallback(String mainTask, String subTask);

class taskDropDown extends StatefulWidget {
  //
  const taskDropDown({@required this.onTaskSet});
  final IntCallback onTaskSet;

  @override
  _taskDropDownState createState() => _taskDropDownState();
}

class _taskDropDownState extends State<taskDropDown> {
  String value = "";
  List<DropdownMenuItem<String>> menuitems = List();
  bool disabledropdown = true;

  final Cleaning = {
    "1": "Clean cowshade.",
    "2": "Cleaning farming tool.",
    "3": "Cleaning working space",
  };
  final Vehicle = {
    "1": "Using Tractor for\nploughing.",
    "2": " Importing and Exporting\nthefarming  tools.",
    "3": "Importing the fertilization and seeds",
    "4": "Storing the food in warehouse"
  };

  final general_handiwork = {
    "1": "Assamble the farming tools.",
    "2": "Cutting grass in farm.",
    "3": "Feeding the animals.",
    "4": "Creatating solution of frtilizer\nfor sprinkle over the crop.",
    "5": "Provide water to farm.",
    "6": "Arrangement of electricity\nor check the  connection.",
    "7": "Walk fields regularly to observe crop and fields."
  };
  final tendingTolivestock = {
    "1": "Feed the animals.",
    "2": "Washing the animals.",
    "3": "Collect the milk.",
    "4": "Arrange the food for animals."
  };
  final Planting = {
    "1": "Prepararing soil as soon\nas weather permits.",
    "2": "Implement production plan maintain crops.",
    "3": "Review overall farm conditon.",
    "4": "Monitor soil and crop condition.",
  };
  final Harvesting = {
    "1": "Today i am doing harvesting",
    "2": "Harvesting is completed",
    "3": "Assembling the tools and vehicle",
    "4": "Storing the food in wearehouse"
  };

  void populateweb() {
    for (String key in Cleaning.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Text(
          Cleaning[key],
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline3,
        ),
        value: Cleaning[key],
      ));
    }
  }

  void populatePlanting() {
    for (String key in Planting.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(Planting[key]),
        ),
        value: Planting[key],
      ));
    }
  }

  void populateHavesting() {
    for (String key in Harvesting.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Container(
          child: Text(
            Harvesting[key],
            overflow: TextOverflow.ellipsis,
          ),
        ),
        value: Harvesting[key],
      ));
    }
  }

  void populateapp() {
    for (String key in Vehicle.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Text(Vehicle[key]),
        value: Vehicle[key],
      ));
    }
  }

  void populatedesktop() {
    for (String key in general_handiwork.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Text(general_handiwork[key]),
        value: general_handiwork[key],
      ));
    }
  }

  void populatedtendingToLivestock() {
    for (String key in tendingTolivestock.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Text(tendingTolivestock[key]),
        value: tendingTolivestock[key],
      ));
    }
  }

  String taskHint = "Select Main Task";
  String subTaskHint = "First Select Main Task";

  void selected(_value) {
    if (_value == "Cleaning") {
      menuitems = [];
      setState(() {
        taskHint = "Cleaning";
      });
      populateweb();
    } else if (_value == "Vehicle") {
      menuitems = [];
      setState(() {
        taskHint = "Vehicle";
      });
      populateapp();
    } else if (_value == "general_handiwork") {
      menuitems = [];
      setState(() {
        taskHint = "General Handwork";
      });
      populatedesktop();
    } else if (_value == "tendingToLivestock") {
      menuitems = [];
      setState(() {
        taskHint = "Tending to Livestock";
      });
      populatedtendingToLivestock();
    } else if (_value == "Planting") {
      menuitems = [];
      setState(() {
        taskHint = "Planting";
      });
      populatePlanting();
    } else if (_value == "Harvesting") {
      menuitems = [];
      setState(() {
        taskHint = "Harvesting";
      });
      populateHavesting();
    }
    setState(() {
      value = _value;
      disabledropdown = false;
      subTaskHint = "Select Sub Task";
    });
  }

  void secondselected(_value) {
    setState(() {
      value = _value;
      subTaskHint = _value.toString();
      widget.onTaskSet(taskHint, subTaskHint);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
              items: [
                DropdownMenuItem<String>(
                  value: "Cleaning",
                  child: Text("Cleaning"),
                ),
                DropdownMenuItem<String>(
                  value: "Vehicle",
                  child: Text("Vehicle"),
                ),
                DropdownMenuItem<String>(
                  value: "general_handiwork",
                  child: Text("General Handiwork"),
                ),
                DropdownMenuItem<String>(
                  value: "tendingTolivestock",
                  child: Text("Tending To Livestock"),
                ),
                DropdownMenuItem<String>(
                  value: "Planting",
                  child: Text("Planting"),
                ),
                DropdownMenuItem<String>(
                  value: "Harvesting",
                  child: Text("Harvesting"),
                ),
              ],
              onChanged: (_value) => selected(_value),
              hint: Text(
                "$taskHint",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                // icon: Icon(Icons.arrow_drop_down),
                // iconSize: 42,
                items: menuitems,
                onChanged:
                    disabledropdown ? null : (_value) => secondselected(_value),
                hint: Container(
                  // constraints: BoxConstraints(maxWidth: 200),
                  child: Text(
                    "$subTaskHint",
                    style: Theme.of(context).textTheme.headline3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                disabledHint: Text(
                  "First Select Main Task",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
