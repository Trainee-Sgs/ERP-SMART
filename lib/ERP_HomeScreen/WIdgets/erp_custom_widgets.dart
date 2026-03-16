import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dashboard.dart';
import '../notification_screen.dart';
import '../overall_report_screen.dart';
import '../settings_screen.dart';

// ── App Model ──────────────────────────────────────────────
class AppModel {
  final String name, desc, img;
  final Color color;
  final IconData? icon;
  final Widget? targetScreen;

  const AppModel({
    required this.name,
    required this.desc,
    required this.img,
    required this.color,
    this.icon,
    this.targetScreen,
  });
}

// ── Custom Palette ──────────────────────────────────────────
class _Palette {
  static const text = Color(0xFF0F172A);
}

// ── Mobile Home-Style App Icon Widget ───────────────────────
class ErpCustomButtom extends StatelessWidget {
  final AppModel app;
  final VoidCallback? onTap;

  const ErpCustomButtom({super.key, required this.app, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onTap ??
          () {
            if (app.targetScreen != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => app.targetScreen!),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${app.name} module is under development'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
      borderRadius: BorderRadius.circular(20.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ── App Icon Box ──
          Container(
            width: 56.w,
            height: 56.h,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  app.color.withValues(alpha: 0.12),
                  app.color.withValues(alpha: 0.03),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: app.color.withValues(alpha: 0.1),
                width: 1.r,
              ),
              boxShadow: [
                BoxShadow(
                  color: app.color.withValues(alpha: 0.05),
                  blurRadius: 10.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: app.img.startsWith('http')
                  ? Image.network(
                      app.img,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(
                          app.icon ?? Icons.apps_rounded,
                          color: app.color,
                          size: 28.sp,
                        ),
                      ),
                    )
                  : Image.asset(
                      app.img,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(
                          app.icon ?? Icons.apps_rounded,
                          color: app.color,
                          size: 28.sp,
                        ),
                      ),
                    ),
            ),
          ),
          SizedBox(height: 6.h),

          // ── App Label ──
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Text(
                app.name,
                style: GoogleFonts.dmSans(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: _Palette.text,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bottom Navigation Bar Widget ───────────────────────
class ErpCustomBar extends StatelessWidget {
  final int selectedIndex;

  const ErpCustomBar({super.key, required this.selectedIndex});

  void _handleNavigation(BuildContext context, int index) {
    if (selectedIndex == index) return;

    if (index == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
        (route) => false,
      );
    } else if (index == 1) {
      if (selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OverallReportScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OverallReportScreen()),
        );
      }
    } else if (index == 2) {
      if (selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NotificationScreen()),
        );
      }
    } else if (index == 3) {
      if (selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF3B8EFF);
    const darkBorder = Color(0xFF1E293B);
    const textMuted = Color(0xFF64748B);

    return Container(
      margin: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
      height: 64.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: darkBorder.withValues(alpha: 0.16),
          width: 1.5.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(
            Icons.grid_view_rounded,
            selectedIndex == 0,
            () => _handleNavigation(context, 0),
            activeColor,
            textMuted,
          ),
          _navItem(
            Icons.analytics_outlined,
            selectedIndex == 1,
            () => _handleNavigation(context, 1),
            activeColor,
            textMuted,
          ),
          _navItem(
            Icons.notifications_none_rounded,
            selectedIndex == 2,
            () => _handleNavigation(context, 2),
            activeColor,
            textMuted,
          ),
          _navItem(
            Icons.settings_outlined,
            selectedIndex == 3,
            () => _handleNavigation(context, 3),
            activeColor,
            textMuted,
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    bool active,
    VoidCallback onTap,
    Color activeColor,
    Color mutedColor,
  ) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: active ? activeColor : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: active ? Colors.white : mutedColor.withValues(alpha: 0.6),
        size: 22.sp,
      ),
    ),
  );
}
