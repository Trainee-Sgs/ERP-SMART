import 'package:crm/Home/dashboard_screen.dart';
import 'package:crm/SignIn/signin.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String? lt;
  static String? ln;
  static String? deviceId;

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? latitude;
  String? longitude;
  String? deviceId;
  bool _isLoading = true;
  String _statusMessage = "Initializing...";

  // Default values as fallback
  static const String defaultLt = '23233443';
  static const String defaultLn = '43432323';
  static const String defaultDeviceId = '3453489';

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    try {
      setState(() => _statusMessage = "Fetching Device ID...");
      await _fetchDeviceId();

      setState(() => _statusMessage = "Fetching Location...");
      await _fetchLocation();

      _checkLoginStatus();
    } catch (e) {
      debugPrint("Error during initialization: $e");
      _navigateToSignIn();
    }
  }

  Future<void> _checkLoginStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? ledId = prefs.getString('led_id'); // Check if user ID exists

      if (mounted) {
        setState(() {
          _isLoading = false;
          _statusMessage = "Done!";
        });

        if (ledId != null && ledId.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        } else {
          _navigateToSignIn();
        }
      }
    } catch (e) {
      debugPrint("Error checking login status: $e");
      _navigateToSignIn();
    }
  }

  Future<void> _fetchLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(
          () => _statusMessage = "Location Services disabled. Using defaults.",
        );
        _useDefaultLocation();
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _statusMessage = "Requesting Location Permission...");
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => _statusMessage = "Permission denied. Using defaults.");
          _useDefaultLocation();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(
          () => _statusMessage = "Permissions restricted. Using defaults.",
        );
        _useDefaultLocation();
        return;
      }

      setState(() => _statusMessage = "Getting current location...");
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      if (mounted) {
        setState(() {
          latitude = position.latitude.toString();
          longitude = position.longitude.toString();
          SplashScreen.lt = latitude;
          SplashScreen.ln = longitude;
        });
      }

      final prefs = await SharedPreferences.getInstance();
      if (latitude != null && longitude != null) {
        await prefs.setString('lt', latitude!);
        await prefs.setString('ln', longitude!);
      }
    } catch (e) {
      debugPrint("Error fetching location: $e");
      _useDefaultLocation();
    }
  }

  void _useDefaultLocation() {
    SplashScreen.lt = defaultLt;
    SplashScreen.ln = defaultLn;
    debugPrint(
      "Fallbacked to default location: ${SplashScreen.lt}, ${SplashScreen.ln}",
    );
  }

  Future<void> _fetchDeviceId() async {
    if (deviceId != null) return;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }

      SplashScreen.deviceId = deviceId ?? defaultDeviceId;

      if (SplashScreen.deviceId != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('device_id', SplashScreen.deviceId!);
      }
      debugPrint("Device ID: ${SplashScreen.deviceId}");
    } catch (e) {
      debugPrint("Error fetching device ID: $e");
      SplashScreen.deviceId = defaultDeviceId;
    }
  }

  void _navigateToSignIn() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/smart.png', width: screenWidth * 0.6),
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/TOTAL ERP.png',
              width: screenWidth * 0.35,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : null,
            ),
            const SizedBox(height: 40),
            if (_isLoading) ...[
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6B4195)),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  _statusMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
