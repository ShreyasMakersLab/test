import 'package:crop_planning_techm/pages/farmdetails.dart';
import 'package:crop_planning_techm/pages/live_crop_pages.dart';
import 'package:flutter/material.dart';

class AddCrop extends StatefulWidget {
  @override
  _AddCropState createState() => _AddCropState();
}

class _AddCropState extends State<AddCrop> {
  Widget _selectedSoil(){
    return Container(
                        child: OutlineButton(
                          // disabledBorderColor: Colors.black45,
                          padding: EdgeInsets.all(16.0),
                          color: Colors.white,
                          onPressed: _showBottomSheet, // Refer step 3
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Select Soil Type',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black54,
                                size: 30,
                              )
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)),
                        ),
                      );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,top: 20
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Select Soil Type',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  Container(
                    // color: Colors.green,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),

                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: Image.network(
                            'https://images.unsplash.com/photo-1582288916603-4698cf723bf6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8c29pbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
                            .image,
                      ),
                      title: Text('Red Soil'),
                      subtitle: Text('30 Acres'),
                      trailing: Icon(Icons.edit),
                      onTap: (){
                        Navigator.pop(context);
                        return _selectedSoil();
                      },
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: Image.network(
                        'https://images.unsplash.com/photo-1519806390608-acf7ef9c8d1b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8c29pbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                        fit: BoxFit.fill,
                      ).image,
                    ),
                    title: Text('White Soil'),
                    subtitle: Text('20 Acres'),
                    trailing: Icon(Icons.edit),
                  ),
                ],
              ),);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Crop Details"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.00,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Select Soil Type',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  Container(
                    child: OutlineButton(
                      // disabledBorderColor: Colors.black45,
                      padding: EdgeInsets.all(16.0),
                      color: Colors.white,
                      onPressed: _showBottomSheet, // Refer step 3
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Seed Type',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                            size: 30,
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Select Seed Type',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  Container(
                    child: OutlineButton(
                      // disabledBorderColor: Colors.black45,
                      padding: EdgeInsets.all(16.0),
                      color: Colors.white,
                      onPressed: () => {}, // Refer step 3
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Enter Your DOB',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                            size: 30,
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Expected Sowing Date',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  Container(
                    child: OutlineButton(
                      // disabledBorderColor: Colors.black45,
                      padding: EdgeInsets.all(16.0),
                      color: Colors.white,
                      onPressed: () => {}, // Refer step 3
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Enter Your DOB',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                            size: 30,
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10.00),
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
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LiveCropPage()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
