import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'WIdgets/erp_custom_widgets.dart';
import 'package:hrm/views/main_root.dart' as hrm_mod;
import 'package:crm/Home/dashboard_screen.dart' as crm_mod;
import 'package:purchase_erp/dashboard.dart' as purchase_mod;
import 'package:sales/Screens/HomeScreen/dashboard.dart' as sales_mod;

// ── Dashboard Screen ─────────────────────────────────────────
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          // Background accents
          Positioned(
            top: -100.h,
            right: -100.w,
            child: _GlowOrb(
              300.w,
              const Color(0xFF3B8EFF).withValues(alpha: 0.05),
            ),
          ),
          Positioned(
            bottom: -50.h,
            left: -50.w,
            child: _GlowOrb(
              250.w,
              const Color(0xFF0D9488).withValues(alpha: 0.05),
            ),
          ),

          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // ── App Bar ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 24.h),
                    child: FadeInDown(
                      duration: const Duration(milliseconds: 600),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80.w,
                            height: 80.h,
                            child: Image.asset(
                              'assets/images/erp_logo.png',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                    Icons.hub,
                                    color: const Color(0xFF3B8EFF),
                                    size: 30.sp,
                                  ),
                            ),
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Smart ERP',
                                  style: GoogleFonts.syne(
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                                Text(
                                  'Workplace Dashboard',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF64748B),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _UserAvatar(),
                        ],
                      ),
                    ),
                  ),
                ),

                // ── Welcome Text ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 700),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select an App to Manage',
                            style: GoogleFonts.syne(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          SizedBox(height: 12.h),
                        ],
                      ),
                    ),
                  ),
                ),

                // ── App Grid (4 Columns, Compact Height) ──
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 0.82,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, i) => FadeInUp(
                        delay: Duration(milliseconds: 50 * i),
                        child: ErpCustomButtom(app: _apps[i]),
                      ),
                      childCount: _apps.length,
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 100.h)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ErpCustomBar(selectedIndex: 0),
    );
  }
}

// ── Dashboard Data (Only 3 Apps for now) ─────────────
final _apps = [
  AppModel(
    name: 'HRM Suite',
    desc: 'Workforce',
    img: 'assets/images/hrm.png',
    color: Color(0xFF3B8EFF),
    targetScreen: const hrm_mod.MainRoot(),
  ),
  AppModel(
    name: 'CRM Hub',
    desc: 'Sales',
    img:
        'https://images.unsplash.com/photo-1552664730-d307ca884978?q=80&w=400&fit=crop',
    color: Color(0xFF0D9488),
    targetScreen: const crm_mod.DashboardScreen(),
  ),
  AppModel(
    name: 'Purchase',
    desc: 'Procurement',
    img:
        'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?q=80&w=400&fit=crop',
    color: Color(0xFFF59E0B),
    targetScreen: const purchase_mod.Dashboard(),
  ),
  AppModel(
    name: 'Sales',
    desc: 'Revenue',
    img:
        'https://images.unsplash.com/photo-1556740738-b6a63e27c4df?q=80&w=400&fit=crop',
    color: Color(0xFF6366F1),
    targetScreen: const sales_mod.SalesDashboard(),
  ),
];

// ── Private Components ───────────────────────────────────────

class _UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2.r),
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
