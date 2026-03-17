import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E3B9E),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Report',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reports',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.tune, color: Colors.grey, size: 24.sp),
              ],
            ),
            SizedBox(height: 16.h),

            // Summary Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 1.5,
              children: [
                _buildSummaryCard(
                  'Total Revenue',
                  '₹2,45,000',
                  Icons.currency_rupee,
                  const Color(0xFF7E39FB),
                ),
                _buildSummaryCard(
                  'Total Orders',
                  '45',
                  Icons.trending_up,
                  const Color(0xFFFBBC05),
                ),
                _buildSummaryCard(
                  'Products Sold',
                  '1,250',
                  Icons.grid_view,
                  const Color(0xFF34A853),
                ),
                _buildSummaryCard(
                  'New Customers',
                  '45',
                  Icons.person_outline,
                  const Color(0xFFEA4335),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Sales Trend Section
            _buildSectionHeader('Sales Trend'),
            Container(
              height: 250.h,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1.5),
              ),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey[300],
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 3),
                        const FlSpot(2, 4),
                        const FlSpot(4, 2),
                        const FlSpot(6, 5),
                        const FlSpot(8, 3),
                        const FlSpot(10, 6),
                      ],
                      isCurved: true,
                      color: const Color(0xFF2E3B9E),
                      barWidth: 3,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          List<Color> dotColors = [
                            Colors.grey,
                            Colors.red,
                            Colors.orange,
                            Colors.green,
                            Colors.lightBlue,
                            Colors.grey,
                          ];
                          return FlDotCirclePainter(
                            radius: 4,
                            color: dotColors[index % dotColors.length],
                            strokeWidth: 0,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: const Color(0xFF2E3B9E).withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Sales by Category Section
            _buildSectionHeader('Sales by Category'),
            Container(
              height: 200.h,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 0,
                        sections: [
                          PieChartSectionData(
                            color: const Color(0xFFE91E63),
                            value: 25,
                            title: '25%',
                            radius: 70,
                            titleStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          PieChartSectionData(
                            color: const Color(0xFF00BCD4),
                            value: 20,
                            title: '20%',
                            radius: 70,
                            titleStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          PieChartSectionData(
                            color: const Color(0xFF2E3B9E),
                            value: 40,
                            title: '40%',
                            radius: 70,
                            titleStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          PieChartSectionData(
                            color: const Color(0xFF7E39FB),
                            value: 15,
                            title: '15%',
                            radius: 70,
                            titleStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLegendItem('Electronics', const Color(0xFFE91E63)),
                        _buildLegendItem('Clothing', const Color(0xFF00BCD4)),
                        _buildLegendItem('Food', const Color(0xFF2E3B9E)),
                        _buildLegendItem('Others', const Color(0xFF7E39FB)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.white, size: 24.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Container(
            width: 10.w,
            height: 10.h,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
