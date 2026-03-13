import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'LoginScreen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _glowController;

  late Animation<double> _opacity;
  late Animation<double> _scale;
  late Animation<double> _glowRadius;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigateToLogin();
  }

  void _setupAnimations() {
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _scale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _glowRadius = Tween<double>(begin: 10.0, end: 30.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
    _mainController.forward();
  }

  void _navigateToLogin() {
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const OnboardingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          Positioned(
            top: -100.h,
            right: -100.w,
            child: _Blob(
              size: 300.w,
              color: const Color(0xFF2979FF).withValues(alpha: 0.05),
            ),
          ),
          Positioned(
            bottom: -80.h,
            left: -80.w,
            child: _Blob(
              size: 250.w,
              color: const Color(0xFF2979FF).withValues(alpha: 0.03),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _opacity,
              child: ScaleTransition(
                scale: _scale,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFF2979FF,
                            ).withValues(alpha: 0.1),
                            blurRadius: 30.r,
                            offset: Offset(0, 10.h),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.hub_rounded,
                        color: const Color(0xFF2979FF),
                        size: 40.sp,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.syne(
                          fontSize: 42.sp,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF0F172A),
                          letterSpacing: -1,
                        ),
                        children: const [
                          TextSpan(text: 'SM'),
                          TextSpan(
                            text: 'ART',
                            style: TextStyle(color: Color(0xFF2979FF)),
                          ),
                        ],
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _glowRadius,
                      builder: (context, child) => Text(
                        'E R P',
                        style: GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 12.w,
                          color: const Color(0xFF2979FF).withValues(alpha: 0.8),
                          shadows: [
                            Shadow(
                              color: const Color(
                                0xFF2979FF,
                              ).withValues(alpha: 0.3),
                              blurRadius: _glowRadius.value,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 48.h),
                    Text(
                      'ENTERPRISE PLATFORM',
                      style: GoogleFonts.dmSans(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 4.w,
                        color: const Color(0xFF64748B).withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 24.w,
                    height: 2.h,
                    child: LinearProgressIndicator(
                      backgroundColor: const Color(
                        0xFF2979FF,
                      ).withValues(alpha: 0.1),
                      color: const Color(0xFF2979FF),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'v 1.0.0',
                    style: GoogleFonts.dmSans(
                      fontSize: 11.sp,
                      color: const Color(0xFF64748B).withValues(alpha: 0.3),
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  final double size;
  final Color color;
  const _Blob({required this.size, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
