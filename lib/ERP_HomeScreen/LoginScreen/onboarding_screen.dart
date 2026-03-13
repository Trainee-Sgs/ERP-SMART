import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erpsmart_app/ERP_HomeScreen/LoginScreen/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'lottie': 'assets/lottie/erp.json',
      'title': 'ALL IN ONE',
      'subtitle': 'Complete ERP Suite',
      'desc':
          'One powerful platform for your entire business. HRM, CRM, Finance, Reports — everything connected and smart.',
    },
    {
      'lottie': 'assets/lottie/hrm.json',
      'title': 'HRM',
      'subtitle': 'Employee Management',
      'desc':
          'Manage your entire workforce effortlessly. Track attendance, leaves, payroll, and employee records — all in one place.',
    },
    {
      'lottie': 'assets/lottie/crm.json',
      'title': 'CRM',
      'subtitle': 'Customer Management',
      'desc':
          'Build stronger customer relationships. Track leads, follow-ups, deals, and support tickets with ease.',
    },
  ];

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFF1F5F9),
                  Color(0xFFF8FAFC),
                ],
                stops: [0.0, 0.4, 1.0],
              ),
            ),
          ),
          Positioned(
            top: -80.h,
            right: -80.w,
            child: _Glow(size: 300.w, color: const Color(0xFF2979FF), op: 0.08),
          ),
          Positioned(
            bottom: -100.h,
            left: -100.w,
            child: _Glow(size: 280.w, color: const Color(0xFF2979FF), op: 0.06),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 20.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2979FF),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.hub_rounded,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Smart ERP',
                            style: GoogleFonts.syne(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF0F172A),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      if (_currentPage < 2)
                        TextButton(
                          onPressed: _goToLogin,
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF64748B),
                          ),
                          child: Text(
                            'Skip',
                            style: GoogleFonts.dmSans(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      else
                        SizedBox(width: 60.w),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (index) =>
                        setState(() => _currentPage = index),
                    itemBuilder: (context, index) => _buildPage(_pages[index]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 28.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _pages.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: const Color(0xFF2979FF),
                          dotColor: const Color(
                            0xFF2979FF,
                          ).withValues(alpha: 0.15),
                          dotHeight: 6,
                          dotWidth: 6,
                          expansionFactor: 4,
                          spacing: 8,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: ElevatedButton(
                          onPressed: _currentPage == 2
                              ? _goToLogin
                              : () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2979FF),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 8,
                            shadowColor: const Color(
                              0xFF2979FF,
                            ).withValues(alpha: 0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _currentPage == 2 ? 'GET STARTED' : 'CONTINUE',
                                style: GoogleFonts.dmSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Icon(Icons.arrow_forward_rounded, size: 20.sp),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Map<String, dynamic> page) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Lottie.asset(page['lottie'], fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            page['title'],
            textAlign: TextAlign.center,
            style: GoogleFonts.syne(
              fontSize: 32.sp,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF0F172A),
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            page['subtitle'].toString().toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: const Color(0xFF2979FF),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            page['desc'],
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF64748B),
              height: 1.5,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  final double size, op;
  final Color color;
  const _Glow({required this.size, required this.op, required this.color});
  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [
          color.withValues(alpha: op),
          Colors.transparent,
        ],
      ),
    ),
  );
}
