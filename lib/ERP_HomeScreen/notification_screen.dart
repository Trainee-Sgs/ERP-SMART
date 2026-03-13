import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'WIdgets/erp_custom_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -100.h,
            left: -80.w,
            child: _GlowOrb(
              300.w,
              const Color(0xFF3B8EFF).withValues(alpha: 0.05),
            ),
          ),
          Positioned(
            bottom: 100.h,
            right: -80.w,
            child: _GlowOrb(
              250.w,
              const Color(0xFF8B5CF6).withValues(alpha: 0.05),
            ),
          ),

          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // ── Header ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
                    child: FadeInDown(
                      duration: const Duration(milliseconds: 600),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Notifications',
                                  style: GoogleFonts.syne(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'You have 3 unread messages',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF64748B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.03),
                                  blurRadius: 10.r,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.done_all_rounded,
                              color: const Color(0xFF3B8EFF),
                              size: 22.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ── Today Section ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 100),
                      child: Text(
                        'TODAY',
                        style: GoogleFonts.dmSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF94A3B8),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                // ── Notifications List (Today) ──
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildNotificationTile(
                        title: 'Leave Request Approved',
                        message:
                            'Your leave request for Mar 15 has been approved.',
                        time: '10:00 AM',
                        isUnread: true,
                        iconData: Icons.check_circle_outline_rounded,
                        iconColors: const [
                          Color(0xFF11998E),
                          Color(0xFF38EF7D),
                        ],
                        delayMs: 200,
                      ),
                      _buildNotificationTile(
                        title: 'Meeting in 15 mins',
                        message: 'Quarterly review meeting starting soon.',
                        time: '09:45 AM',
                        isUnread: true,
                        iconData: Icons.videocam_outlined,
                        iconColors: const [
                          Color(0xFF3B8EFF),
                          Color(0xFF2563EB),
                        ],
                        delayMs: 300,
                      ),
                      _buildNotificationTile(
                        title: 'Invoice #1024 Generated',
                        message:
                            'The invoice for Client X has been automatically generated.',
                        time: '08:30 AM',
                        isUnread: true,
                        iconData: Icons.receipt_long_rounded,
                        iconColors: const [
                          Color(0xFF8E2DE2),
                          Color(0xFF4A00E0),
                        ],
                        delayMs: 400,
                      ),
                    ]),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 24.h)),

                // ── Yesterday Section ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 500),
                      child: Text(
                        'YESTERDAY',
                        style: GoogleFonts.dmSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF94A3B8),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                // ── Notifications List (Yesterday) ──
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildNotificationTile(
                        title: 'System Maintenance',
                        message: 'ERP System will be down for 2 hours tonight.',
                        time: 'Mar 9',
                        isUnread: false,
                        iconData: Icons.warning_amber_rounded,
                        iconColors: const [
                          Color(0xFFF59E0B),
                          Color(0xFFF97316),
                        ],
                        delayMs: 600,
                      ),
                      _buildNotificationTile(
                        title: 'New Policy Update',
                        message: 'Please review the updated HR policies.',
                        time: 'Mar 9',
                        isUnread: false,
                        iconData: Icons.policy_outlined,
                        iconColors: const [
                          Color(0xFF64748B),
                          Color(0xFF475569),
                        ],
                        delayMs: 700,
                      ),
                    ]),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 100.h)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ErpCustomBar(selectedIndex: 2),
    );
  }

  Widget _buildNotificationTile({
    required String title,
    required String message,
    required String time,
    required bool isUnread,
    required IconData iconData,
    required List<Color> iconColors,
    required int delayMs,
  }) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      delay: Duration(milliseconds: delayMs),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: isUnread ? Colors.white : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: isUnread
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 15.r,
                    offset: Offset(0, 5.h),
                  ),
                ]
              : [],
          border: isUnread
              ? null
              : Border.all(
                  color: const Color(0xFFE2E8F0).withValues(alpha: 0.6),
                ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: iconColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: iconColors[0].withValues(alpha: 0.3),
                    blurRadius: 10.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Icon(iconData, color: Colors.white, size: 20.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.syne(
                            fontSize: 15.sp,
                            fontWeight: isUnread
                                ? FontWeight.w700
                                : FontWeight.w600,
                            color: const Color(0xFF0F172A),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        time,
                        style: GoogleFonts.dmSans(
                          fontSize: 11.sp,
                          color: isUnread
                              ? const Color(0xFF3B8EFF)
                              : const Color(0xFF94A3B8),
                          fontWeight: isUnread
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    message,
                    style: GoogleFonts.dmSans(
                      fontSize: 13.sp,
                      color: const Color(0xFF64748B),
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;
  const _GlowOrb(this.size, this.color);
  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
    ),
  );
}
