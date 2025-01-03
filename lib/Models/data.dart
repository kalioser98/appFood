import 'package:foodloop/models/chart_data.dart';
import 'package:foodloop/views/utils/AppColor.dart';

class Data {
  static List<ChartData> resultados = [
    ChartData('enero', 100, AppColor.primary),
    ChartData('febrero', 80, AppColor.primary),
    ChartData('marzo', 60, AppColor.primary),
    ChartData('abril', 40, AppColor.primary),
    ChartData('mayo', 20, AppColor.primary),
    ChartData('junio', 20, AppColor.primary),
    ChartData('julio', 20, AppColor.primary),
  ];
}
