import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({Key key, @required this.titleText}) : super(key: key);
  final String titleText;
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

   String titleText;



List<String> categories = [
    'Black',
    'Red',
    'White'
  ];
 String _category;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 8),
        child: DropdownButtonFormField(
          items: categories.map((String category) {
            return DropdownMenuItem<String>(
                value: category,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text(category),
                  ],
                )
            );
          }).toList(),
          onChanged: (newValue) {
            // do other stuff with _category
            setState(() => _category = newValue);
          },
          value: _category,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 16, 10, 16),


              hintText: widget.titleText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18)
              )
          )
        ),
      );

  }
}
