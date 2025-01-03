import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:foodloop/views/utils/config.dart' as config;

class BarSyncFusionContent extends StatefulWidget {
  final Function actualizar;
  final double totalPrice;
  final Map<String, dynamic> purchasesByMonth;
  BarSyncFusionContent(
      {super.key,
      required this.actualizar,
      required this.totalPrice,
      required this.purchasesByMonth});

  @override
  State<BarSyncFusionContent> createState() => _BarSyncFusionContentState();
}

class _BarSyncFusionContentState extends State<BarSyncFusionContent> {
  BarTouchData getTouch() {
    return BarTouchData(
      enabled: true,
      touchCallback: (event, barTouchResponse) {
        try {
          if (event is! PointerUpEvent &&
              event is! PointerExitEvent &&
              barTouchResponse!.spot != null) {
            final touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            int count = 0;
            for (String month in widget.purchasesByMonth.keys) {
              if (count == touchedIndex) {
                config.valorMes = widget.purchasesByMonth[month];
                config.mes = month;
                break;
              }
              count++;
            }
            setState(() {});
            widget.actualizar();
            // print('Barra clicada: $touchedIndex');
          }
        } catch (e) {
          // print(e);
        }
      },
      allowTouchBarBackDraw: true,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            const TextStyle(
              color: Color(0Xff0A5550),
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Color(0Xff0A5550),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = "";
    int count = 0;
    for (String month in widget.purchasesByMonth.keys) {
      if (count == value.toInt()) {
        text = month;
        break;
      }
      count++;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> getBarGroups() {
    List<BarChartGroupData> listBars = [];
    int count = 0;
    for (String month in widget.purchasesByMonth.keys) {
      listBars.add(BarChartGroupData(
        x: count,
        barRods: [
          BarChartRodData(
              toY: widget.purchasesByMonth[month] / 1000,
              color: Color(0xff042A2B),
              width: 25)
        ],
        showingTooltipIndicators: [0],
      ));
      count++;
    }
    return listBars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 200,
      child: BarChart(
        BarChartData(
          barTouchData: getTouch(),
          titlesData: titlesData,
          borderData: borderData,
          barGroups: getBarGroups(),
          gridData: const FlGridData(show: false),
          alignment: BarChartAlignment.spaceAround,
          maxY: 20,
        ),
      ),
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: SizedBox(
    //         width: MediaQuery.of(context)
    //             .size
    //             .width, // Anchura de la gráfica igual al ancho de la pantalla
    //         child: SfCartesianChart(
    //           series: <CartsSeries>[
    //             ColumnSeries<ChartData, String>(
    //               dataSource: Data.resultados,
    //               xValueMapper: (ChartData data, _) => data.x,
    //               yValueMapper: (ChartData data, _) => data.y,
    //               pointColorMapper: (ChartData data, _) => data.color,
    //             ),
    //           ],
    //           primaryXAxis: CategoryAxis(
    //             labelStyle: const TextStyle(
    //               fontSize: 10,
    //               fontWeight: FontWeight.bold,
    //               color: Color.fromARGB(255, 0, 0, 0),
    //             ),
    //             majorGridLines: const MajorGridLines(width: 0),
    //           ),
    //           primaryYAxis: NumericAxis(
    //             isVisible: false, // Oculta el eje y
    //             interval: 5,
    //             labelStyle: const TextStyle(
    //               fontSize: 10,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.grey,
    //             ),
    //             majorGridLines: const MajorGridLines(width: 0),
    //             edgeLabelPlacement: EdgeLabelPlacement.shift,
    //             axisLine: AxisLine(width: 0), // Oculta la línea del eje y
    //           ),
    //           title: ChartTitle(
    //             text: 'Record',
    //             textStyle: const TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 15,
    //               fontFamily: 'Inter', // Agregamos el tipo de letra Inter
    //               color: AppColor
    //                   .primary, // Cambiamos el color al definido en AppColor
    //             ),
    //           ),
    //           tooltipBehavior: TooltipBehavior(
    //             enable: true,
    //             header: 'Ahorro del mes',

    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
