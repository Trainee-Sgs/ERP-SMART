import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'WIdgets/erp_custom_widgets.dart';

class OverallReportScreen extends StatelessWidget {
  const OverallReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.2),
        leading: Icon(Icons.menu, color: Colors.black, size: 26.sp),
        title: Text(
          'ERP Dashboard',
          style: GoogleFonts.inter(
            color: const Color(0xFF2E2198),
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Icon(
              Icons.notifications_none_rounded,
              color: Colors.black,
              size: 26.sp,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                child: Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.grey.withOpacity(0.4)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12.w),
                      Icon(Icons.search, color: Colors.grey, size: 20.sp),
                      SizedBox(width: 8.w),
                      Text(
                        'Search...',
                        style: GoogleFonts.dmSans(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 4 Cards Grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.6,
                  mainAxisSpacing: 14.h,
                  crossAxisSpacing: 14.w,
                  children: [
                    _buildDashCard('Total Sales', '₹ 56,240', '12.5%', const [
                      Color(0xFF5E35B1),
                      Color(0xFF9C27B0),
                    ]),
                    _buildDashCard('Total Orders', '1,235', '12.5%', const [
                      Color(0xFFE65100),
                      Color(0xFFFF9800),
                    ]),
                    _buildDashCard('Active Customers', '850', '12.5%', const [
                      Color(0xFF1565C0),
                      Color(0xFF42A5F5),
                    ]),
                    _buildDashCard('Service Request', '320', '12.5%', const [
                      Color(0xFF00796B),
                      Color(0xFF26A69A),
                    ]),
                  ],
                ),
              ),

              // Sales Overview Chart Section
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sales Overvies',
                          style: GoogleFonts.dmSans(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Monthly',
                                  style: GoogleFonts.dmSans(
                                    color: const Color(0xFF3B8EFF),
                                    fontSize: 13.sp,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  height: 1.5.h,
                                  width: 50.w,
                                  color: const Color(0xFF3B8EFF),
                                ),
                              ],
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Yearly',
                              style: GoogleFonts.dmSans(
                                color: Colors.grey,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 160.h,
                      width: double.infinity,
                      child: CustomPaint(painter: _ChartPainter()),
                    ),
                  ],
                ),
              ),

              // Recent Orders Table Section
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.r),
                      child: Text(
                        'Recent Orders',
                        style: GoogleFonts.dmSans(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey[300]),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Order ID',
                              style: GoogleFonts.dmSans(
                                color: Colors.grey[500],
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Customer',
                              style: GoogleFonts.dmSans(
                                color: Colors.grey[500],
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Status',
                              style: GoogleFonts.dmSans(
                                color: Colors.grey[500],
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Amount',
                                style: GoogleFonts.dmSans(
                                  color: Colors.grey[500],
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey[300]),
                    _buildOrderRow(
                      '#1024',
                      'Alice Smith',
                      'Completed',
                      const Color(0xFF00C853),
                      '₹250',
                    ),
                    Divider(height: 1, color: Colors.grey[300]),
                    _buildOrderRow(
                      '#1025',
                      'Michael Lee',
                      'Pending',
                      const Color(0xFFFFAB00),
                      '₹150',
                    ),
                    Divider(height: 1, color: Colors.grey[300]),
                    _buildOrderRow(
                      '#1026',
                      'David kim',
                      'Shipped',
                      const Color(0xFF651FFF),
                      '₹340',
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),

              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ErpCustomBar(selectedIndex: 1),
    );
  }

  Widget _buildDashCard(
    String title,
    String value,
    String percent,
    List<Color> colors,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: colors[0].withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              percent,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderRow(
    String id,
    String name,
    String status,
    Color statusColor,
    String amount,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              id,
              style: GoogleFonts.dmSans(
                color: const Color(0xFF3B8EFF),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: GoogleFonts.dmSans(
                color: Colors.black87,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              status,
              style: GoogleFonts.dmSans(
                color: statusColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                amount,
                style: GoogleFonts.dmSans(
                  color: Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.grey[200]!
      ..strokeWidth = 1;

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    double leftMargin = 20.w;

    // Draw horizontal grid lines and labels
    for (int i = 0; i <= 6; i++) {
      double y = size.height - (i * (size.height / 6));
      canvas.drawLine(Offset(leftMargin, y), Offset(size.width, y), gridPaint);

      textPainter.text = TextSpan(
        text: i.toString(),
        style: GoogleFonts.dmSans(color: Colors.grey[400], fontSize: 10.sp),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(2.w, y - 6.h));
    }

    // Draw bottom numbers
    for (int i = 0; i <= 11; i++) {
      double stepX = (size.width - leftMargin) / 11;
      double x = leftMargin + (i * stepX);
      if (i > 0) {
        textPainter.text = TextSpan(
          text: i.toString(),
          style: GoogleFonts.dmSans(color: Colors.grey[400], fontSize: 10.sp),
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(x - 4.w, size.height + 4.h));
      }
    }

    void drawSmoothPath(List<double> data, Color color) {
      if (data.isEmpty) return;
      double stepX = (size.width - leftMargin) / (data.length - 1);

      final points = <Offset>[];
      for (int i = 0; i < data.length; i++) {
        points.add(
          Offset(
            leftMargin + i * stepX,
            size.height - (data[i] / 6) * size.height,
          ),
        );
      }

      final path = Path();
      path.moveTo(points[0].dx, points[0].dy);

      for (int i = 0; i < points.length - 1; i++) {
        final p0 = points[i];
        final p1 = points[i + 1];
        path.cubicTo(
          p0.dx + (p1.dx - p0.dx) / 2,
          p0.dy,
          p0.dx + (p1.dx - p0.dx) / 2,
          p1.dy,
          p1.dx,
          p1.dy,
        );
      }

      final paint = Paint()
        ..color = color
        ..strokeWidth = 2.5
        ..style = PaintingStyle.stroke;

      canvas.drawPath(path, paint);

      // Draw dots
      final dotPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      for (int i = 3; i < points.length; i += 3) {
        canvas.drawCircle(points[i], 4.r, dotPaint);
      }
      canvas.drawCircle(points[0], 4.r, Paint()..color = Colors.grey);
      canvas.drawCircle(points.last, 4.r, dotPaint);
    }

    // Match screenshot curves exactly using scaled coordinates out of 6
    drawSmoothPath([
      0,
      1.4,
      2,
      2,
      1.4,
      1.4,
      3,
      4.3,
      4.8,
      5,
      5,
    ], const Color(0xFF26A69A)); // Teal
    drawSmoothPath([
      0,
      2,
      2.9,
      3.1,
      3.2,
      3,
      2.8,
      2.4,
      2.2,
      2.9,
      3,
    ], const Color(0xFFFF7043)); // Orange
    drawSmoothPath([
      0,
      2.4,
      2.9,
      2.8,
      2,
      1.5,
      1.2,
      1.1,
      1.6,
      2,
      2,
    ], const Color(0xFFCDDC39)); // Lime Green
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
