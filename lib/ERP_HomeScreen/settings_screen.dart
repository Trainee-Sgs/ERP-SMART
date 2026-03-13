import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'WIdgets/erp_custom_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -100.h,
            right: -80.w,
            child: _GlowOrb(
              300.w,
              const Color(0xFF0D9488).withValues(alpha: 0.05),
            ),
          ),
          Positioned(
            bottom: 50.h,
            left: -80.w,
            child: _GlowOrb(
              250.w,
              const Color(0xFF3B8EFF).withValues(alpha: 0.05),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Settings',
                            style: GoogleFonts.syne(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Manage preferences and configuration',
                            style: GoogleFonts.dmSans(
                              fontSize: 12.sp,
                              color: const Color(0xFF64748B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ── Profile Overview ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 100),
                      child: Container(
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 15.r,
                              offset: Offset(0, 5.h),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.r,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 10.r,
                                    offset: Offset(0, 4.h),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=200&fit=crop',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Admin User',
                                    style: GoogleFonts.syne(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF0F172A),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'admin@smart-erp.com',
                                    style: GoogleFonts.dmSans(
                                      fontSize: 13.sp,
                                      color: const Color(0xFF64748B),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFF3B8EFF,
                                ).withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit_rounded,
                                color: const Color(0xFF3B8EFF),
                                size: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 32.h)),

                // ── Settings Sections ──
                _buildSectionHeader('ACCOUNT', 200),
                _buildSettingsList([
                  _SettingsItemData(
                    icon: Icons.person_outline_rounded,
                    title: 'Personal Information',
                    color: const Color(0xFF3B8EFF),
                  ),
                  _SettingsItemData(
                    icon: Icons.lock_outline_rounded,
                    title: 'Password & Security',
                    color: const Color(0xFF0D9488),
                  ),
                  _SettingsItemData(
                    icon: Icons.payment_rounded,
                    title: 'Billing & Details',
                    color: const Color(0xFFF59E0B),
                  ),
                ], 300),

                SliverToBoxAdapter(child: SizedBox(height: 24.h)),

                _buildSectionHeader('PREFERENCES', 400),
                _buildSettingsList([
                  _SettingsItemData(
                    icon: Icons.notifications_active_outlined,
                    title: 'Push Notifications',
                    color: const Color(0xFF8E2DE2),
                    isToggle: true,
                    toggleValue: true,
                  ),
                  _SettingsItemData(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    color: const Color(0xFF1E293B),
                    isToggle: true,
                    toggleValue: false,
                  ),
                  _SettingsItemData(
                    icon: Icons.language_rounded,
                    title: 'Language',
                    color: const Color(0xFFEF4444),
                    trailingText: 'English',
                  ),
                ], 500),

                SliverToBoxAdapter(child: SizedBox(height: 24.h)),

                _buildSectionHeader('SUPPORT & ABOUT', 600),
                _buildSettingsList([
                  _SettingsItemData(
                    icon: Icons.help_outline_rounded,
                    title: 'Help Center',
                    color: const Color(0xFF3B8EFF),
                  ),
                  _SettingsItemData(
                    icon: Icons.info_outline_rounded,
                    title: 'Terms & Policies',
                    color: const Color(0xFF0D9488),
                  ),
                ], 700),

                SliverToBoxAdapter(child: SizedBox(height: 48.h)),

                // ── Logout Button ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 800),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(16.r),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(
                                0xFFEF4444,
                              ).withValues(alpha: 0.3),
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                            color: const Color(
                              0xFFEF4444,
                            ).withValues(alpha: 0.05),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Log Out',
                            style: GoogleFonts.syne(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFEF4444),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 100.h)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ErpCustomBar(selectedIndex: 3),
    );
  }

  Widget _buildSectionHeader(String title, int delayMs) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
        child: FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: Duration(milliseconds: delayMs),
          child: Text(
            title,
            style: GoogleFonts.dmSans(
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF94A3B8),
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsList(List<_SettingsItemData> items, int delayMs) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: Duration(milliseconds: delayMs),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 10.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: items.length,
              separatorBuilder: (context, index) => Divider(
                color: const Color(0xFFF1F5F9),
                height: 1,
                indent: 64.w,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: item.color.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(item.icon, color: item.color, size: 20.sp),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Text(
                          item.title,
                          style: GoogleFonts.dmSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                      ),
                      if (item.isToggle)
                        CupertinoSwitch(
                          value: item.toggleValue ?? false,
                          activeColor: const Color(0xFF3B8EFF),
                          onChanged: (val) {},
                        )
                      else if (item.trailingText != null)
                        Row(
                          children: [
                            Text(
                              item.trailingText!,
                              style: GoogleFonts.dmSans(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF64748B),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: const Color(0xFFCBD5E1),
                              size: 14.sp,
                            ),
                          ],
                        )
                      else
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: const Color(0xFFCBD5E1),
                          size: 14.sp,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsItemData {
  final IconData icon;
  final String title;
  final Color color;
  final bool isToggle;
  final bool? toggleValue;
  final String? trailingText;

  _SettingsItemData({
    required this.icon,
    required this.title,
    required this.color,
    this.isToggle = false,
    this.toggleValue,
    this.trailingText,
  });
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
