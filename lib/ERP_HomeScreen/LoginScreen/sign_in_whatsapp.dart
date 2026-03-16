import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'sign_in_sms.dart';
import 'sign_up.dart';
import 'otp_popup.dart';
import 'package:hrm/services/device_service.dart';

class WhatsappLogin extends StatefulWidget {
  const WhatsappLogin({super.key});

  @override
  State<WhatsappLogin> createState() => _WhatsappLoginState();
}

class _WhatsappLoginState extends State<WhatsappLogin> {
  final TextEditingController _emailController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    DeviceService.initDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.13),

                /// Logo
                Center(
                  child: Image.asset(
                    'assets/images/erp_logo.png',
                    width: width * 0.55,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: height * 0.05),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.01),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Manage your customers, sales & business anywhere.",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),

                SizedBox(height: height * 0.05),

                /// WhatsApp Field
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  buildCounter:
                      (
                        context, {
                        required currentLength,
                        required isFocused,
                        maxLength,
                      }) => null,
                  decoration: const InputDecoration(
                    labelText: "Enter WhatsApp Number",
                    labelStyle: TextStyle(color: Colors.black54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff26A69A)),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.05),

                /// Next Button
                SizedBox(
                  width: 280,
                  height: height * 0.06,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _sendOtpApi,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff26A69A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),

                SizedBox(height: height * 0.04),

                /// OR Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.black26)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "or continue with",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.black26)),
                  ],
                ),

                SizedBox(height: height * 0.03),

                /// Social Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.mail_outline,
                          size: 20,
                          color: Color(0xff26A69A),
                        ),
                        label: const Text(
                          "Via Mail",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff26A69A)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SmsLogin()),
                          );
                        },
                        icon: const Icon(
                          Icons.phone_android,
                          size: 20,
                          color: Color(0xff26A69A),
                        ),
                        label: const Text(
                          "Via SMS",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff26A69A)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.04),

                /// Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an Account? ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignupScreen()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff000080),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.06),

                /// Terms
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "By Continuing you agree to our\n",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms and Conditions",
                        style: TextStyle(
                          color: Color(0xff26A69A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// SEND OTP API
  Future<void> _sendOtpApi() async {
    final mobile = _emailController.text.trim();
    if (mobile.isEmpty) {
      _snack("Please enter WhatsApp number", false);
      return;
    }
    if (mobile.length != 10) {
      _snack("WhatsApp number must be exactly 10 digits", false);
      return;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(mobile)) {
      _snack("WhatsApp number must contain only digits", false);
      return;
    }

    setState(() => isLoading = true);

    try {
      /* // API binding commented for future implementation
      final prefs = await SharedPreferences.getInstance();
      final lat = prefs.getDouble('lat')?.toString() ?? "0.0";
      final lng = prefs.getDouble('lng')?.toString() ?? "0.0";
      final deviceId = prefs.getString('device_id') ?? "";
      final appSignature = prefs.getString('app_signature') ?? "";

      final response = await LoginApi.sendOtp(
        mobile: _emailController.text.trim(),
        type: "2000",
        deviceId: deviceId,
        lat: lat,
        lng: lng,
        appSignature: appSignature,
      );
      */

      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return OtpBottomSheet(
              phoneNumber: _emailController.text.trim(),
              cusId: "12345", // Dummy ID
            );
          },
        );
      }
    } catch (e) {
      debugPrint("OTP ERROR => $e");
      if (mounted) _snack("Server error", false);
    }

    if (mounted) setState(() => isLoading = false);
  }

  void _snack(String msg, bool success) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: success ? Colors.green : Colors.red,
        ),
      );
    }
  }
}
