import 'package:crop_planning_techm/Models/UserDataModels/farm_data.dart';
import 'package:crop_planning_techm/services/task_db_helper.dart';
import 'package:flutter/material.dart';

typedef FarmCallBack = String Function(String);
typedef SizeCallBack = int Function(int);
typedef NewFarmSize = int Function(int);

class SelectFarmForCrop extends StatefulWidget {
  final FarmModel farmInfo;
  final FarmCallBack farmName;
  final SizeCallBack farmSize;

  SelectFarmForCrop({
    @required this.farmInfo,
    @required this.farmName,
    @required this.farmSize,
  });

  @override
  _SelectFarmForCropState createState() => _SelectFarmForCropState();
}

class _SelectFarmForCropState extends State<SelectFarmForCrop> {
  bool _isVisible = false;
  TextEditingController custSizeController = TextEditingController();
  int updatedFarmSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              onTap: () {
                setState(() {
                  _isVisible ? _isVisible = false : _isVisible = true;
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  widget.farmInfo.farmName.substring(0, 2).toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              ),
              title: Text(widget.farmInfo.farmName,
                  style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  updatedFarmSize == null
                      ? "Total Size: ${widget.farmInfo.farmSize} Acres"
                      : "Area Left: " + "$updatedFarmSize" + " Acres",
                  style: Theme.of(context).textTheme.headline4),
              trailing: Icon(
                Icons.arrow_drop_down_circle_sharp,
                size: 24,
              ),
            ),
          ),
        ),
        Visibility(
          maintainState: true,
          visible: _isVisible,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Color(0x33000000))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select Entire Farm",
                              style: Theme.of(context).textTheme.headline3),
                          Switch(value: false, onChanged: null)
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: custSizeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              labelText: "Enter Custom Farm Size",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: IconButton(
                                  icon: Icon(Icons.arrow_forward),
                                  color: Colors.white,
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    updateFarmSize();
                                    widget.farmName(widget.farmInfo.farmName);
                                    widget.farmSize(
                                        int.parse(custSizeController.text));
                                    custSizeController.clear();
                                    setState(() {
                                      _isVisible = false;
                                    });
                                  })),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  updateFarmSize() async {
    setState(() {
      updatedFarmSize =
          widget.farmInfo.farmSize - int.parse(custSizeController.text);
    });

    final db = TaskDBHelper.instance;
    return await db.updateFarmSize(widget.farmInfo.farmName, updatedFarmSize);
  }
}
