import 'package:crop_planning_techm/Models/UserDataModels/crop_data.dart';
import 'package:crop_planning_techm/pages/ListOfCrops.dart';
import 'package:crop_planning_techm/pages/homepage.dart';
import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:crop_planning_techm/widgets/crop_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CropDetails extends StatefulWidget {
  @override
  _CropDetailsState createState() => _CropDetailsState();
}

class _CropDetailsState extends State<CropDetails> {
  TextEditingController farmController = new TextEditingController();

  //
  // Color _selectedColor = Colors.white;
  // bool _isVisible = false;

  // List<String> cropList = [
  //   'Cotton',
  //   'Sugar Cane',
  //   'Rice',
  //   'Wheat',
  //   'Millets',
  //   'Jute'
  // ];

  @override
  Widget build(BuildContext context) {
    _fetchCropFromDB();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Choose Crops',
            style: Theme.of(context).appBarTheme.textTheme.headline1),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                  child: Text('Select Crop:',
                      style: Theme.of(context).textTheme.headline2),
                ),
                ListView.builder(
                    itemCount: cropList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int i) {
                      return CropTileWidget(
                        cropName: cropList[i],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            padding: EdgeInsets.all(14),
            child: Text(
              'NEXT',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
          ),
        ),
      ),
    );
  }

  //
  _fetchCropFromDB() async {
    final taskDBHelper = TaskDBHelper.instance;

    List<CropModel> _crops = await taskDBHelper.fetchCrops();
    // setState(() {
    //   farms = _farms;
    // });FF
    print(_crops[0].cropName);
  }
}
