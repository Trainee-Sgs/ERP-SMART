import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:another_flushbar/flushbar.dart';

// ── Theme tokens ─────────────────────────────────────────────
class _T {
  static const text = Color(0xFF0F172A);
  static const teal = Color(0xFF0D9488);
  static const err = Color(0xFFEF4444);
  static const gold = Color(0xFFF59E0B);
  static const accent = Color(0xFF3B8EFF);
}

// ── Snackbar types ────────────────────────────────────────────
enum _Type { success, error, warning, info }

// ── Public API ────────────────────────────────────────────────
class ErpSnackbar {
  ErpSnackbar._();

  /// Green — operation completed successfully
  static void success(BuildContext ctx, String msg, {String? title}) =>
      _show(ctx, type: _Type.success, msg: msg, title: title);

  /// Red — something went wrong
  static void error(BuildContext ctx, String msg, {String? title}) =>
      _show(ctx, type: _Type.error, msg: msg, title: title);

  /// Amber — caution / soft warning
  static void warning(BuildContext ctx, String msg, {String? title}) =>
      _show(ctx, type: _Type.warning, msg: msg, title: title);

  /// Blue — neutral information
  static void info(BuildContext ctx, String msg, {String? title}) =>
      _show(ctx, type: _Type.info, msg: msg, title: title);

  // ── Internal builder ───────────────────────────────────────
  static void _show(
    BuildContext ctx, {
    required _Type type,
    required String msg,
    String? title,
  }) {
    final color = _color(type);
    final icon = _icon(type);

    Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 50.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      borderRadius: BorderRadius.circular(14.r),
      backgroundColor: Colors.white,
      borderColor: color.withValues(alpha: .35),
      leftBarIndicatorColor: color,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .05),
          blurRadius: 24.r,
          offset: Offset(0, 8.h),
        ),
      ],
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 380),
      forwardAnimationCurve: Curves.easeOutCubic,
      reverseAnimationCurve: Curves.easeInCubic,
      icon: const SizedBox.shrink(),
      messageText: Row(
        children: [
          // Icon badge
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: color.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: color.withValues(alpha: .2)),
            ),
            child: Icon(icon, color: color, size: 18.sp),
          ),
          SizedBox(width: 12.w),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null) ...[
                  Text(
                    title,
                    style: GoogleFonts.syne(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: color,
                      letterSpacing: -.2.w,
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
                Text(
                  msg,
                  style: GoogleFonts.dmSans(
                    fontSize: 13.sp,
                    color: _T.text,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).show(ctx);
  }

  static Color _color(_Type t) => switch (t) {
    _Type.success => _T.teal,
    _Type.error => _T.err,
    _Type.warning => _T.gold,
    _Type.info => _T.accent,
  };

  static IconData _icon(_Type t) => switch (t) {
    _Type.success => Icons.check_circle_rounded,
    _Type.error => Icons.error_rounded,
    _Type.warning => Icons.warning_amber_rounded,
    _Type.info => Icons.info_rounded,
  };
}
