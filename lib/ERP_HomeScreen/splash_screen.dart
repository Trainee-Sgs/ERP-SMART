import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'LoginScreen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await _saveLocation(); // Commented for future implementation
      await _navigateNext();
    });
  }

  /// CHECK LOGIN & NAVIGATE
  Future<void> _navigateNext() async {
    /* // API binding commented for future implementation
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Load Security Settings
    bool bioEnabled = prefs.getBool('auth_biometric_enabled') ?? false;
    bool appFaceEnabled = prefs.getBool('auth_app_face_enabled') ?? false;
    bool pinEnabled = prefs.getBool('auth_pin_enabled') ?? false;
    String? savedPin = prefs.getString('auth_pin_code');
    */

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Direct navigation to LoginScreen for UI demonstration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );

    /*
    if (isLoggedIn) {
      // Check if security is enabled
      if (bioEnabled ||
          appFaceEnabled ||
          (pinEnabled && savedPin != null && savedPin.isNotEmpty)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => AppLockScreen(
              isBiometricEnabled: bioEnabled,
              isAppFaceEnabled: appFaceEnabled,
              isPinEnabled: pinEnabled,
              savedPin: savedPin,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
    */
  }

  /// SAVE LATITUDE & LONGITUDE
  Future<void> _saveLocation() async {
    /* // Commented for future implementation
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.medium),
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('lat', position.latitude);
      await prefs.setDouble('lng', position.longitude);
    } catch (e) {
      debugPrint("Location error in splash: $e");
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/erp_logo.png', width: 220.w),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

