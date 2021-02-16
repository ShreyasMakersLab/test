import 'package:flutter/material.dart';

class CropInfo extends StatefulWidget {
  @override
  _CropInfoState createState() => _CropInfoState();
}

class _CropInfoState extends State<CropInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pumpkin",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Duration\n',
                            style: Theme.of(context).textTheme.headline3),
                        TextSpan(
                            text: 'Nov - Dec (5 Weks)\n\n',
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(color: Colors.black54)),
                        TextSpan(
                            text: 'Seed Rate\n',
                            style: Theme.of(context).textTheme.headline3),
                        TextSpan(
                            text: '2kg/ha\n\n',
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(color: Colors.black54)),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width / 5,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1506917728037-b6af01a7d403?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=967&q=80"),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Seed Treatment\n",
                        style: Theme.of(context).textTheme.headline3),
                    TextSpan(
                        text:
                            "Dip whole or cut tubers, spread treated seed pieces in a cool place if held before planting. Dip whole or cut tubers, spread treated seed pieces in a cool place if held before planting. ",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: Colors.black54))
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Seed preparation\n",
                        style: Theme.of(context).textTheme.headline3),
                    TextSpan(
                        text:
                            "Dip whole or cut tubers, spread treated seed pieces in a cool place if held before planting. Dip whole or cut tubers, spread treated seed pieces in a cool place if held before planting. ",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: Colors.black54))
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Seed preparation\n",
                        style: Theme.of(context).textTheme.headline3),
                    TextSpan(
                        text:
                            "Dip whole or cut tubers, spread treated seed pieces in a cool place if held before planting. Dip whole or cut tubers, spread treated seed pieces in a cool place if held before planting. ",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: Colors.black54))
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
