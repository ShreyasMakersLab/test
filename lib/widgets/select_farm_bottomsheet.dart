import 'package:crop_planning_techm/Models/UserDataModels/crop_data.dart';
import 'package:crop_planning_techm/Models/UserDataModels/farm_data.dart';
import 'package:crop_planning_techm/pages/choose_crops.dart';
import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:crop_planning_techm/widgets/select_farm_for_crop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'date_picker.dart';

// typedef FarmCallBack = String Function(String);
// typedef SizeCallBack = int Function(int);
// typedef SowingDateCallBack = String Function(String);
typedef TileSelected = bool Function(bool);

class SelectFarmBottomSheet extends StatefulWidget {
  final String selectedCrop;
  // final FarmCallBack farmName;
  // final SizeCallBack farmSize;
  // final SowingDateCallBack sowingDate;
  final TileSelected isTileSelected;

  SelectFarmBottomSheet(
      {@required this.selectedCrop,
      // @required this.farmName,
      // @required this.farmSize,
      // @required this.sowingDate,
      @required this.isTileSelected});

  @override
  _SelectFarmBottomSheetState createState() => _SelectFarmBottomSheetState();
}

class _SelectFarmBottomSheetState extends State<SelectFarmBottomSheet> {
  List<FarmModel> farms;
  TextEditingController farmController = TextEditingController();

  String selectedFarmName;
  int selectedFarmSize;
  String dateFromPicker;
  int _updateFarmSizeFromChild;

  bool _isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchFarmFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crop Info"),
      ),
      floatingActionButton: const SizedBox(height: 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8, left: 16, right: 16, top: 40),
                    child: Text('Select Farms:',
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  farms != null
                      ? ListView.builder(
                          itemCount: farms.length,
                          padding: EdgeInsets.all(8),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int i) {
                            return SelectFarmForCrop(
                              farmInfo: farms[i],
                              farmName: (String _farmName) {
                                return selectedFarmName = _farmName;
                              },
                              farmSize: (int _farmSize) {
                                return selectedFarmSize = _farmSize;
                              },
                            );
                          },
                        )
                      : Center(
                          child: Container(
                            child: Text("Unable to load Farms"),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Divider(
                      thickness: 1,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(
                  //   "Soil type",
                  //   style: Theme.of(context).textTheme.headline3,
                  // ),
                  // DropDownWidget(
                  //   titleText: "Select Soil Type",
                  // ),
                  // Text(
                  //   "Seed type",
                  //   style: Theme.of(context).textTheme.headline3,
                  // ),
                  // DropDownWidget(
                  //   titleText: "Select Seed type",
                  // ),
                  Text(
                    "Expected Sowing Date",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  DatePickerWidget(
                    hintDate: dateFromPicker == null
                        ? "Select Expected Sowing Date"
                        : dateFromPicker,
                    onDateSet: (String selectedDate) {
                      setState(() {
                        dateFromPicker = selectedDate;
                      });
                      return dateFromPicker;
                    },
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Color(0xB3000000)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (selectedFarmName != null &&
                          selectedFarmSize != null &&
                          dateFromPicker != null) {
                        _insertCropToDB();
                        setState(() {
                          _isSelected = true;
                        });
                        widget.isTileSelected(_isSelected);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CropDetails()));
                      } else {
                        print("In selected");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "All Fields are Required",
                          ),
                          behavior: SnackBarBehavior.floating,
                        ));
                      }
                    },
                    child: Text("SELECT",
                        style: Theme.of(context).textTheme.headline2),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _insertCropToDB() async {
    WidgetsFlutterBinding.ensureInitialized();

    final taskDBHelper = TaskDBHelper.instance;

    CropModel crop = CropModel(
      cropName: widget.selectedCrop,
      farmSelected: selectedFarmName,
      farmSizeSelected: selectedFarmSize,
      sowingDate: dateFromPicker,
    );

    final _res = await taskDBHelper.insertCrops(crop);
    print("Crop inserted at ${_res}");
  }

  _fetchFarmFromDB() async {
    final taskDBHelper = TaskDBHelper.instance;

    List<FarmModel> _farms = await taskDBHelper.fetchFarms();
    setState(() {
      farms = _farms;
    });
    print(_farms.length);
  }
}
