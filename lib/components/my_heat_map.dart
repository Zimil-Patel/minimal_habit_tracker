import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key, required this.startDate, required this.dataset});

  final DateTime startDate;
  final Map<DateTime, int> dataset;

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      startDate: startDate,
      size: 32,
      showText: true,
      showColorTip: false,
      endDate: DateTime.now(),
      scrollable: true,
      textColor: Theme.of(context).colorScheme.onSurface,
      colorMode: ColorMode.color,
      defaultColor: Theme.of(context).colorScheme.tertiary,
      datasets: dataset,
      colorsets: {
        1: Colors.green.shade200,
        2: Colors.green.shade300,
        3: Colors.green.shade400,
        4: Colors.green.shade500,
        5: Colors.green.shade600,
      },
    );
  }
}
