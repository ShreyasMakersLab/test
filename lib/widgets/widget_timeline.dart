import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class WidgetTimeline extends StatelessWidget {
  final String title;
  final int index;
  WidgetTimeline({this.title, this.index});
  @override
  Widget build(BuildContext context) {
    return  TimelineTile(
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: index == 1 ? true : false,
      isLast: index == 5? true:false ,

      indicatorStyle: IndicatorStyle(
        color: Colors.green,
        iconStyle: IconStyle(
          color: Colors.white,
          iconData: Icons.done,
        ),

      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 4),
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey
          ),
          constraints: const BoxConstraints(
            minWidth: 80,
            maxWidth: 80,
          ),
          child: Text(
            '$title',
            textAlign: TextAlign.start,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}