import 'package:crop_planning_techm/pages/image_picker.dart';
import 'package:crop_planning_techm/widgets/widget_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class CropProfile extends StatefulWidget {
  @override
  _CropProfileState createState() => _CropProfileState();
}

class _CropProfileState extends State<CropProfile> {
  final Map<int, String> list3 = {
    1: "Pre-Planting",
    2: "Tiller Initiation and Development",
    3: "Grand Growth",
    4: "Maturity an Harvest",
    5: "Harvesting"
  };

  List<charts.Series> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();

    final desktopSalesData = [
      Sales('Budget', 6000),
      Sales('Expenditure', 4000),
      Sales('Profit', 8000),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      defaultRenderer: new charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(30)),
    );
  }

  List<Widget> getList() {
    List<Widget> childs = [];
    for (var index in list3.keys) {
      childs.add(WidgetTimeline(title: list3[index], index: index));
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crop Profile",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImagePickerWidget(imagepickerpadding: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Pumpkin',
                        style: Theme.of(context).textTheme.headline3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        Text(
                          'Farm 1',
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                constraints: BoxConstraints(
                  maxHeight: 160,
                  minHeight: 100,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 8,left: 16),
                        child: Text('Growth Stage',
                            style: Theme.of(context).textTheme.headline3),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          margin: EdgeInsets.only(top: 16),
                          height: 52,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[...getList()]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFFF2F2F2), width: 1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  // elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 8,left: 16),
                        child: Text('Expenditure Chart',
                            style: Theme.of(context).textTheme.headline3),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Container(
                        height: 250,
                        padding: EdgeInsets.all(10),
                        child: barChart(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8,left: 16),
                        child: Text("Planting",
                            style: Theme.of(context).textTheme.headline3),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.7, minWidth: 100),
                              child: Text(
                                  "Plant sugarcane by following dry method of planting. Prepare sticks",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black54)),
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width/4,

                              child: FittedBox(

                                  fit: BoxFit.fill,
                                  child: Image.network(

                                      "https://images.unsplash.com/photo-1525279844598-52fd0d3fecc2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80"

                                  ),),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              // padding:EdgeInsets.all(10),
                              child: FlatButton(
                                onPressed: null,
                                child: Text(
                                  'Know More',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.green)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: FlatButton(
                                onPressed: () {},
                                color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white),
                                        child: Icon(Icons.done,
                                            color: Colors.green)),
                                    Text(
                                      'Done',
                                      style: Theme.of(context).textTheme.headline4.copyWith(
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.green)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 8,left: 16),
                        child: Text(
                          "Crop Info",
                          style: Theme.of(context).textTheme.headline3,
                        )),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF62EC83),
                                  ),
                                  child: Column(
                                    children: [
                                      // Icon(Icons.biotech_sharp,size: 42,),
                                      Image(
                                        image:
                                            AssetImage('images/seed_sow.png'),
                                        height: MediaQuery.of(context).size.width /6,
                                      ),
                                      Text(
                                        "4 KG",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      )
                                    ],
                                  )),
                              Text(
                                "Seed",
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF62EC83),
                                  ),
                                  child: Column(
                                    children: [

                                      Image(
                                        image:
                                            AssetImage('images/fertilizer.png'),
                                        height: MediaQuery.of(context).size.width /6,
                                      ),
                                      Text(
                                        "5 Ltr",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      )
                                    ],
                                  )),
                              Text(
                                "Fertilizer",
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF62EC83),
                                  ),
                                  child: Column(
                                    children: [
                                      // Icon(Icons.biotech_sharp,size: 42,),
                                      Image(
                                        image: AssetImage('images/labour.png'),
                                          height: MediaQuery.of(context).size.width /6
                                      ),
                                      Text(
                                        "3000 Rs",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5.copyWith(
                                          fontSize: 14
                                        ),
                                      )
                                    ],
                                  )),
                              Text(
                                "Labour",
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Sales {
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}
