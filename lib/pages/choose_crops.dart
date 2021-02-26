import 'package:crop_planning_techm/pages/crop_info.dart';
import 'package:crop_planning_techm/pages/homepage.dart';
import 'package:crop_planning_techm/widgets/farm_selection_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CropDetails extends StatefulWidget {
  @override
  _CropDetailsState createState() => _CropDetailsState();
}

class _CropDetailsState extends State<CropDetails> {
  TextEditingController farmController = new TextEditingController();
  var _farmSize;

  Color _selectedColor = Colors.white;
  bool _isVisible = false;

  _showBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(child: SelectFarmBottomSheet());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Choose Crops',
            style: Theme.of(context).appBarTheme.textTheme.headline1),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    child: Text('Select Crop:',
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        onTap: _showBottomSheet,
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: Image.network(
                                  'https://images.unsplash.com/photo-1519897831810-a9a01aceccd1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFybXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
                              .image,
                        ),
                        title: Text('Crop 1',
                            style: Theme.of(context).textTheme.headline3),
                        // subtitle: Text('30 Acres'),
                        trailing: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CropInfo())),
                          child: Icon(
                            Icons.info_outline_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: Image.network(
                            'https://images.unsplash.com/photo-1536657464919-892534f60d6e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTN8fGZhcm18ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                            fit: BoxFit.fill,
                          ).image,
                        ),
                        title: Text('Crop 2',
                            style: Theme.of(context).textTheme.headline3),
                        // subtitle: Text('20 Acres'),
                        trailing: Icon(
                          Icons.info_outline_rounded,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
}
