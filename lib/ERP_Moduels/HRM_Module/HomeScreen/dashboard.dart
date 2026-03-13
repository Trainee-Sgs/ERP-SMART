import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/hrm_custom_buttom.dart';

class HrmDashboardScreen extends StatelessWidget {
  const HrmDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // ── Header Section ──
            Container(
              color: const Color(0xFFDFEAFD), // Light blue background
              padding: EdgeInsets.only(
                top: 50.h,
                left: 16.w,
                right: 16.w,
                bottom: 20.h,
              ),
              child: Row(
                children: [
                  // Back / Logo Icon
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2E63F6),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning , Admin',
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFF2C3246),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'HRM DASHBOARD',
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFF6B7280),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Search Icon
                  _buildHeaderIcon(Icons.search),
                  SizedBox(width: 8.w),
                  // Notification Icon
                  _buildHeaderIcon(Icons.notifications_none_rounded),
                  SizedBox(width: 8.w),
                  // Avatar
                  CircleAvatar(
                    radius: 17.r,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=200&fit=crop',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Stats Cards Grid ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.person,
                          iconColor: const Color(0xFF3B8EFF),
                          iconBgColor: const Color(0xFFE5F0FF),
                          title: 'Total Employees',
                          value: '1,250',
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.domain,
                          iconColor: const Color(0xFF10B981),
                          iconBgColor: const Color(0xFFDCFCE7),
                          title: 'Departments',
                          value: '12',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.currency_rupee,
                          iconColor: const Color(0xFFF59E0B),
                          iconBgColor: const Color(0xFFFEF3C7),
                          title: 'Payroll Expense',
                          value: '1,20,000',
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.hourglass_empty,
                          iconColor: const Color(0xFFEF4444),
                          iconBgColor: const Color(0xFFFEE2E2),
                          title: 'Pending Request',
                          value: '12',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // ── Quick Actions ──
                  Text(
                    'Quick Actions',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF374151),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 0.82,
                    ),
                    itemCount: _hrmApps.length,
                    itemBuilder: (context, index) {
                      return HrmCustomButtom(app: _hrmApps[index]);
                    },
                  ),

                  SizedBox(height: 28.h),

                  // ── Overview Section ──
                  Text(
                    'Attendance Overview',
                    style: GoogleFonts.dmSans(
                      color: const Color(0xFF374151),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD6D3D1).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '85% Avg Present',
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFF6B7280),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'This Week',
                          style: GoogleFonts.dmSans(
                            color: const Color(0xFF6B7280),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Statistics',
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFF374151),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          _buildLegendDot(const Color(0xFF0F62FE), 'Present'),
                          SizedBox(width: 12.w),
                          _buildLegendDot(const Color(0xFF90C2FF), 'Absent'),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // ── Custom Bar Chart ──
                  SizedBox(
                    height: 150.h,
                    width: double.infinity,
                    child: CustomPaint(painter: _BarChartPainter()),
                  ),

                  SizedBox(height: 60.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HrmCustomBar(selectedIndex: 0),
    );
  }

  Widget _buildLegendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 8.w,
          height: 8.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 4.w),
        Text(
          label,
          style: GoogleFonts.dmSans(
            color: const Color(0xFF6B7280),
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: const Color(0xFF6B7280), size: 20.sp),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF6B7280),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: GoogleFonts.dmSans(
                    color: const Color(0xFF111827),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.grey[100]!
      ..strokeWidth = 1;

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    double leftMargin = 22.w;

    // Y-axis horizontal lines
    for (int i = 0; i <= 6; i++) {
      double y = size.height - (i * (size.height / 6));
      canvas.drawLine(Offset(leftMargin, y), Offset(size.width, y), gridPaint);

      if (i > 0) {
        textPainter.text = TextSpan(
          text: '${i}0k',
          style: GoogleFonts.dmSans(color: Colors.grey[400], fontSize: 8.sp),
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(0, y - 5.h));
      } else {
        textPainter.text = TextSpan(
          text: '0',
          style: GoogleFonts.dmSans(color: Colors.grey[400], fontSize: 8.sp),
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(8.w, y - 5.h));
      }
    }

    // 7 Groups matching screenshot pattern visually
    int groups = 7;
    double groupWidth = (size.width - leftMargin) / groups;
    double barWidth = groupWidth * 0.38; // Width for each bar

    // Data mapped to look exactly like the multi-colored bar sequence
    final lightData = [2.6, 3.2, 2.6, 3.4, 2.0, 3.4, 2.0];
    final darkData = [5.0, 5.8, 3.8, 5.2, 3.4, 4.5, 5.2];

    final lightPaint = Paint()
      ..color = const Color(0xFF90C2FF)
      ..style = PaintingStyle.fill;

    final darkPaint = Paint()
      ..color = const Color(0xFF0F62FE)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < groups; i++) {
      double groupX = leftMargin + (i * groupWidth);

      // Light Bar
      double lightHeight = (lightData[i] / 6.0) * size.height;
      double lightLeft = groupX + (groupWidth * 0.05);
      double lightRight = lightLeft + barWidth;
      double lightTop = size.height - lightHeight;
      double lightBottom = size.height;

      // Dark Bar
      double darkHeight = (darkData[i] / 6.0) * size.height;
      double darkLeft = lightRight + 2.w; // tight spacing
      double darkRight = darkLeft + barWidth;
      double darkTop = size.height - darkHeight;
      double darkBottom = size.height;

      // Draw Light Bar rounded top
      canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          lightLeft,
          lightTop,
          lightRight,
          lightBottom,
          topLeft: Radius.circular(2.r),
          topRight: Radius.circular(2.r),
        ),
        lightPaint,
      );

      // Draw Dark Bar rounded top
      canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          darkLeft,
          darkTop,
          darkRight,
          darkBottom,
          topLeft: Radius.circular(2.r),
          topRight: Radius.circular(2.r),
        ),
        darkPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Quick Actions Data ───────────────────────────────────────
const _hrmApps = [
  AppModel(
    name: 'Add Employee',
    desc: 'Hiring',
    img: '',
    color: Color(0xFF10B981), // Emerald Green
    icon: Icons.person_add_alt_1,
  ),
  AppModel(
    name: 'Daily Roster',
    desc: 'Attendance',
    img: '',
    color: Color(0xFF8B5CF6), // Purple
    icon: Icons.work_history,
  ),
  AppModel(
    name: 'Process Salary',
    desc: 'Payroll',
    img: '',
    color: Color(0xFFF59E0B), // Orange
    icon: Icons.receipt_long,
  ),
  AppModel(
    name: 'Generate Report',
    desc: 'Analytics',
    img: '',
    color: Color(0xFF0EA5E9), // Light Blue
    icon: Icons.assessment,
  ),
];
