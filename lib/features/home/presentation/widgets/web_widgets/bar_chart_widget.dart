import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:serve_home/core/colors/app_color.dart';
import 'package:serve_home/core/helpers/screen_size.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<double> _values = [28, 50, 32, 20, 16, 15, 18];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<BarChartGroupData> _generateAnimatedBars(
    BuildContext context,
    double t,
  ) {
    double barWidth = (ScreenSize.w(context) * 0.04).clamp(12, 40);

    return List.generate(_values.length, (i) {
      final currentHeight = _values[i] * t;

      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: currentHeight,
            width: barWidth,
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 32, 79, 231),
                Color.fromARGB(255, 97, 20, 168),
              ],
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double chartHeight = (ScreenSize.h(context) * 0.45).clamp(250, 400);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, chartHeight * (1 - _animation.value) * 0.3),
          child: Opacity(
            opacity: _animation.value,
            child: SizedBox(
              height: chartHeight,
              width: double.infinity,
              child: BarChart(
                BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem:
                          (group, groupIndex, rod, rodIndex) => BarTooltipItem(
                                '${rod.toY.toStringAsFixed(0)} bookings',
                                TextStyle(
                                  color: Colors.white,
                                  fontSize: (ScreenSize.w(context) * 0.03)
                                      .clamp(10, 14),
                                ),
                              ),
                      getTooltipColor: (group) => AppColor.primary,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = [
                            'Mon',
                            'Sun',
                            'Tue',
                            'Wed',
                            'Thu',
                            'Fri',
                            'Sat',
                          ];
                          double fontSize =
                              (ScreenSize.w(context) * 0.035).clamp(10, 14);
                          return Text(
                            days[value.toInt()],
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: _generateAnimatedBars(context, _animation.value),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
