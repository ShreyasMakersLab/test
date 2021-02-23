import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 440,
        height: 330,
        padding: new EdgeInsets.all(10.0),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            elevation: 10,
            child: Column(
              children: [
                ListTile(
                  leading: Text(' 17 Feb 2021',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),

                  title: Text('29*c',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.wb_sunny,
                    size: 50,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 190),
                  child: Text('Min-19*c / Max-31*c',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black45,
                ),
                Column(
                  children: [
                    Row(
                      children: [

                        Expanded(
                            child:Column(
                              children: [
                                Text('Sun'),
                                Divider(
                                  color: Colors.black,

                                ),
                                Text('17'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Min-19*c'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Max-31*c'),
                              ],
                            ),
                            ),
                        Container(
                          height: 110,
                          child:VerticalDivider(
                            color: Colors.black,
                          ),),
                        Expanded(
                          child:Column(
                            children: [
                              Text('Mon'),
                              Divider(
                                color: Colors.black,
                              ),
                              Text('18'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Min-19*c'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Max-31*c'),
                            ],
                          ),
                        ),
                        Container(
                          height: 110,
                          child:VerticalDivider(
                            color: Colors.black,
                          ),),
                        Expanded(
                          child:Column(
                            children: [
                              Text('Tuse'),
                              Divider(
                                color: Colors.black,
                              ),
                              Text('19'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Min-19*c'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Max-31*c'),
                            ],
                          ),
                        ),
                        Container(
                          height: 110,
                          child:VerticalDivider(
                            color: Colors.black,
                          ),),
                        Expanded(
                          child:Column(
                            children: [
                              Text('wed'),
                              Divider(
                                color: Colors.black,
                              ),
                              Text('20'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Min-19*c'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Max-31*c'),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),

                        ),
                        Container(
                          height: 110,
                          child:VerticalDivider(
                            color: Colors.black,
                          ),),
                        Expanded(
                          child:Column(
                            children: [
                              Text('Fri'),
                              Divider(
                                color: Colors.black,
                              ),
                              Text('21'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Min-19*c'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Max-31*c'),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 110,
                          child:VerticalDivider(
                            color: Colors.black,
                          ),),
                        Expanded(
                          child:Column(
                            children: [
                              Text('Sat'),
                              Divider(
                                color: Colors.black,
                              ),
                              Text('22'
                                  '  '),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Min-19*c'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Max-31*c'),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                    Divider(
                      height: 1,
                      color: Colors.black,
                    ),
                    // Row(
                    //
                    //   children: [
                    //     VerticalDivider(
                    //       width: 30,
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Expanded(
                    //         flex: 5,
                    //           child:MaterialButton(
                    //             onPressed: (){},
                    //             child: Text('Share'),
                    //             color: Colors.black45,
                    //
                    //
                    //           ),
                    //       ),
                    //     ),
                    //     VerticalDivider(
                    //       width: 100,
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Expanded(
                    //         flex: 5,
                    //         child:MaterialButton(
                    //           onPressed: (){},
                    //           child: Text('Speak'),
                    //           color: Colors.black45,
                    //
                    //         ),
                    //       ),
                    //     ),
                    //
                    //   ],
                    // ),
                  ],
                ),
          ],
      ),
    ),
    ),
    );
  }
}