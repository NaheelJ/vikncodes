import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/app/bottom_navigation/controllers/dashboard_provider.dart';

class RevenueAnalyticsCard extends StatelessWidget {
  const RevenueAnalyticsCard({super.key});

  void _showMonthYearPicker(BuildContext context, DashboardProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final months = List.generate(12, (index) => index + 1);
            final currentYear = provider.selectedDate.year;
            final currentMonth = provider.selectedDate.month;

            return SafeArea(
              bottom: true,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF111111),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Handle
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // Year Selector Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left, color: Colors.white),
                          onPressed: () {
                            provider.setMonthYear(currentMonth, currentYear - 1);
                            setModalState(() {});
                          },
                        ),
                        // Editable Year TextField
                        SizedBox(
                          width: 100,
                          child: TextField(
                            onChanged: (value) {
                              final newYear = int.tryParse(value);
                              if (newYear != null && value.length == 4) {
                                provider.setMonthYear(currentMonth, newYear);
                                setModalState(() {});
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            controller: TextEditingController(text: currentYear.toString())
                              ..selection = TextSelection.fromPosition(
                                TextPosition(offset: currentYear.toString().length),
                              ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right, color: Colors.white),
                          onPressed: () {
                            provider.setMonthYear(currentMonth, currentYear + 1);
                            setModalState(() {});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Months Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 2.2,
                      ),
                      itemCount: months.length,
                      itemBuilder: (context, index) {
                        final month = months[index];
                        final isSelected = month == currentMonth;
                        return GestureDetector(
                          onTap: () {
                            provider.setMonthYear(month, currentYear);
                            Navigator.pop(context);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF2979FF)
                                  : const Color(0xFF1C2A2F),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              DateFormat('MMM').format(DateTime(2023, month)),
                              style: GoogleFonts.poppins(
                                color: isSelected ? Colors.white : const Color(0xFF838383),
                                fontSize: 14,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    // Done Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2979FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Done",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF131313),
        borderRadius: BorderRadius.circular(29),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "SAR ",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF838383),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "2,78,000.00",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "+21% ",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF00C853),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "than last month.",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF838383),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Revenue",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Chart Section
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 1000,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(color: Color(0xFF1C3347), strokeWidth: 1);
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1000,
                        reservedSize: 28,
                        getTitlesWidget: (value, meta) {
                          String text = '';
                          switch (value.toInt()) {
                            case 0:
                              text = '0';
                              break;
                            case 1000:
                              text = '1K';
                              break;
                            case 2000:
                              text = '2K';
                              break;
                            case 3000:
                              text = '3K';
                              break;
                            case 4000:
                              text = '4K';
                              break;
                          }
                          return Text(
                            text,
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: 9,
                  minY: 0,
                  maxY: 4200,
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: true,
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (touchedSpot) => Colors.transparent,
                      tooltipPadding: EdgeInsets.zero,
                      tooltipMargin: 8,
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((touchedSpot) {
                          return LineTooltipItem(
                            'SAR 3945.00',
                            GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        }).toList();
                      },
                    ),
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> spotIndexes) {
                          return spotIndexes.map((spotIndex) {
                            return TouchedSpotIndicatorData(
                              const FlLine(color: Colors.white, strokeWidth: 1),
                              const FlDotData(show: false),
                            );
                          }).toList();
                        },
                  ),
                  showingTooltipIndicators: [
                    ShowingTooltipIndicators([
                      LineBarSpot(
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 400),
                            FlSpot(1, 2400),
                            FlSpot(2, 2100),
                            FlSpot(3, 3700),
                            FlSpot(4, 2600),
                            FlSpot(5, 3200),
                            FlSpot(6, 2000),
                            FlSpot(7, 2400),
                            FlSpot(8, 1700),
                            FlSpot(9, 2500),
                          ],
                        ),
                        0,
                        const FlSpot(3, 3700),
                      ),
                    ]),
                  ],
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 400),
                        FlSpot(1, 2400),
                        FlSpot(2, 2100),
                        FlSpot(3, 3700),
                        FlSpot(4, 2600),
                        FlSpot(5, 3200),
                        FlSpot(6, 2000),
                        FlSpot(7, 2400),
                        FlSpot(8, 1700),
                        FlSpot(9, 2500),
                      ],
                      isCurved: true,
                      color: const Color(0xFF00D0FF),
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF00D0FF).withValues(alpha: 0.4),
                            const Color(0xFF00D0FF).withValues(alpha: 0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 7),
            child: Divider(color: Color(0xFF1C3347)),
          ),
          const SizedBox(height: 16),
          // Month Label (Clickable)
          Center(
            child: GestureDetector(
              onTap: () => _showMonthYearPicker(context, provider),
              child: Text(
                provider.monthYearString,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Date Selector (Scrollable)
          SizedBox(
            height: 32,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 5),
              scrollDirection: Axis.horizontal,
              itemCount: provider.daysInMonth,
              itemBuilder: (context, index) {
                final dateInt = index + 1;
                final dateStr = dateInt.toString().padLeft(2, '0');
                final isSelected = provider.selectedDate.day == dateInt;

                return GestureDetector(
                  onTap: () => provider.setDate(dateInt),
                  child: Container(
                    width: 32,
                    height: 32,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF2489E7)
                          : const Color(0xFF131313),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        dateStr,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
