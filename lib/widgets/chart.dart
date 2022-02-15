import 'package:playlist_duration/models/video.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/material.dart';

class PointsLineChart extends StatelessWidget {
  final List<Video> listVidoes;
  PointsLineChart({this.listVidoes});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: double.infinity,
      child: SfCartesianChart(
        series: _createSampleData(listVidoes),
        primaryXAxis:
            NumericAxis(minimum: 1, labelAlignment: LabelAlignment.center,),
        axisLabelFormatter: (AxisLabelRenderDetails args) {
          String text;
          if (args.axisName == 'primaryYAxis') {
            text = args.value.toString() + 'm';
          } else {
            text = args.text;
          }
          return ChartAxisLabel(text, args.textStyle);
        },
      ),
    );
  }

  List<ColumnSeries<Video, int>> _createSampleData(List<Video> listVidoes) {
    return [
      ColumnSeries<Video, int>(
          dataSource: listVidoes,
          xValueMapper: (Video sales, _) => sales.videoIndex,
          yValueMapper: (Video sales, _) => sales.duration,
          borderRadius: BorderRadius.all(Radius.circular(15))),
    ];
  }
}

// class PointsLineChart extends StatelessWidget {
//   final List<Video> listVidoes;
//   PointsLineChart({this.listVidoes});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200.0,
//       width: double.infinity,
//       child: SfCartesianChart(series: _createSampleData(listVidoes),axisLabelFormatter: (AxisLabelRenderDetails args) {
//                   String text;
//                   if (args.axisName == 'primaryYAxis') {
//                     print(args.value);
//                     text = args.value.toString()+'m';
//                   } else {
//                     text = args.text;
//                   }
//                   return ChartAxisLabel(text, args.textStyle);
//                 },),
//     );
//   }

//   List<SplineAreaSeries<Video, int>> _createSampleData(List<Video> listVidoes) {

//     return [
//       SplineAreaSeries<Video, int>(
//         dataSource: listVidoes,
//         splineType: SplineType.cardinal,
//         cardinalSplineTension: 0.1,
//         xValueMapper: (Video sales, _) => sales.videoIndex,
//         yValueMapper: (Video sales, _) => sales.duration,
//         sortingOrder: SortingOrder.descending,
//       ),
//     ];
//   }
// }