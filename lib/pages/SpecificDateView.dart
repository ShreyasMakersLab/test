import 'package:crop_planning_techm/widgets/date_picker.dart';
import 'package:flutter/material.dart';


class SpecificDateView extends StatefulWidget {
  @override
  _SpecificDateViewState createState() => _SpecificDateViewState();
}

class _SpecificDateViewState extends State<SpecificDateView> {

  DateTime initDate = DateTime.now();
  String selectedDate = "Due Date...";
  var formattedDate="Due Date...";

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate:initDate, // Refer step 1
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
    if (picked != null && picked != initDate)
      setState(() {
        selectedDate = picked.toString();
        var date = DateTime.parse(selectedDate);
        formattedDate = "${date.day}-${date.month}-${date.year}";

      });
  }

 bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tuesday, 16",
        style:  Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isVisible?_isVisible = false:_isVisible = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Your Task", style: Theme.of(context).textTheme.headline3,),
                      Icon(Icons.add)
                    ]

                  ),
                ),
              ),
              Visibility(
                maintainState: true,
                maintainAnimation: true,
                  visible: _isVisible,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border:Border.all(color: Color(0x33000000))
                    ),
                      padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(padding:EdgeInsets.only(bottom: 10) ,child: Text("Add Task",style: Theme.of(context).textTheme.headline3,)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                labelText: 'Task name...'),
                          ),
                        ),
                        Container(child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                               _selectDate(context);
                              },
                              child: Chip(avatar: Icon(Icons.date_range), label: Text(formattedDate,style: Theme.of(context).textTheme.headline4,))
                            ),
                            Text("Create", style: Theme.of(context).textTheme.headline2,)
                          ],
                        ))

                      ],
                    ),
                  ),

              ),
              TodoHolder(todo: "Water the Farm",),
              TodoHolder(todo: "Clean the farm")
            ],
          ),)
        ),
      ),
    );
  }
}

class TodoHolder extends StatefulWidget {
  String todo ="";
  TodoHolder({
   this.todo
});
  @override
  _TodoHolderState createState() => _TodoHolderState();
}

class _TodoHolderState extends State<TodoHolder> {
  bool isDone =false;
  var strike = TextStyle(
    fontSize: 18,
      color: Color(0xBF000000)
  );


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){
                    setState(() {
                      if(isDone){
                        isDone =false;
                        strike = TextStyle(
                            fontSize: 18,
                            color: Color(0xBF000000)
                        );

                      }
                      else{
                        isDone =true;
                        strike = TextStyle(
                            fontSize: 18,
                            color: Colors.black38,
                            decoration: TextDecoration.lineThrough,

                        );
                      }
                    });
                },
                child: Icon(isDone ? Icons.check_box
                      : Icons.check_box_outline_blank,color: Theme.of(context).accentColor,)),
            SizedBox(
              width: 24,
            ),
            Text(widget.todo ?? "Title Unavailable", style: strike,),
          ],
        )
    );
  }
}

