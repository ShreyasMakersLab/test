import 'package:crop_planning_techm/pages/crop_info.dart';
import 'package:crop_planning_techm/widgets/select_farm_bottomsheet.dart';
import 'package:flutter/material.dart';

class CropTileWidget extends StatefulWidget {
  final String cropName;

  CropTileWidget({@required this.cropName});

  @override
  _CropTileWidgetState createState() => _CropTileWidgetState();
}

class _CropTileWidgetState extends State<CropTileWidget> {
  bool _isTileSelected = false;

  List<String> selectedCropList = [];
  String selectedCrop;
  String selectedFarm;
  int selectedFarmSize;
  String sowingDate;

  @override
  Widget build(BuildContext context) {
    print("here ${_isTileSelected}");
    return ListTile(
      selected: _isTileSelected,
      tileColor: Colors.white,
      selectedTileColor: Colors.green,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () {
        _selectCrop(widget.cropName);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => _extraCropDetails()));

        print(selectedCrop);
      },
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('images/${widget.cropName}.jpg'),
      ),
      title:
          Text(widget.cropName, style: Theme.of(context).textTheme.headline3),
      // subtitle: Text('30 Acres'),
      trailing: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CropInfo())),
        child: Icon(
          Icons.info_outline_rounded,
          size: 30,
        ),
      ),
    );
  }

  _extraCropDetails() {
    return SelectFarmBottomSheet(
      selectedCrop: selectedCrop,
      // farmName: (String _farmName) {
      //   return selectedFarm = _farmName;
      // },
      // farmSize: (int _farmSize) {
      //   return selectedFarmSize = _farmSize;
      // },
      // sowingDate: (String _date) {
      //   return sowingDate = _date;
      // },
      isTileSelected: (bool isTileSelected) {
        setState(() {
          _isTileSelected = isTileSelected;
        });
        return _isTileSelected;
      },
    );
  }

  _selectCrop(String crop) {
    setState(() {
      selectedCrop = crop;
    });
  }
}
