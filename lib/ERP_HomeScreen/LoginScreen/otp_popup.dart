import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../dashboard.dart';

class OtpBottomSheet extends StatefulWidget {
  final String phoneNumber;
  final String cusId;

  const OtpBottomSheet({
    super.key,
    required this.phoneNumber,
    required this.cusId,
  });

  @override
  State<OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> with CodeAutoFill {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

  bool isLoading = false;
  Timer? _timer;
  int _start = 60;
  bool _canResend = false;

  @override
  void codeUpdated() {
    setState(() {
      _otpController.text = code ?? "";
      if (_otpController.text.length == 6) {
        _verifyOtpApi();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _start = 60;
    _canResend = false;
    _timer?.cancel();

    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _canResend = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    cancel();
    _timer?.cancel();
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: height * 0.02,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: width * 0.05,
                    backgroundColor: Colors.grey.shade300,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: width * 0.04,
                        color: Colors.black54,
                      ),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    "Verify with OTP",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.03),

              RichText(
                text: TextSpan(
                  text: "Waiting to automatically detect an OTP sent to \n",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.038,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: "${widget.phoneNumber}. ",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "Wrong Number?",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.03),

              Center(
                child: SizedBox(
                  height: height * 0.065,
                  width: width,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          return _buildOtpDigitBox(
                            index,
                            width * 0.12,
                            height * 0.065,
                            width * 0.045,
                          );
                        }),
                      ),
                      Positioned.fill(
                        child: TextField(
                          controller: _otpController,
                          focusNode: _otpFocusNode,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          autofocus: true,
                          showCursor: false,
                          enableInteractiveSelection: false,
                          autofillHints: const [AutofillHints.oneTimeCode],
                          style: const TextStyle(color: Colors.transparent),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                          onChanged: (value) {
                            setState(() {});
                            if (value.length == 6) {
                              _verifyOtpApi();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _canResend ? _resendOtpApi : null,
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(
                        color: _canResend
                            ? const Color(0xff26A69A)
                            : Colors.black54,
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    "00:${_start.toString().padLeft(2, '0')}",
                    style: TextStyle(
                      color: const Color(0xff26A69A),
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              SizedBox(
                width: double.infinity,
                height: height * 0.06,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _verifyOtpApi,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff26A69A),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        )
                      : Text(
                          "Verify",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpDigitBox(
    int index,
    double width,
    double height,
    double fontSize,
  ) {
    String text = "";
    if (_otpController.text.length > index) {
      text = _otpController.text[index];
    }

    final bool isFocused = index == _otpController.text.length;
    final bool isFilled = index < _otpController.text.length;

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isFocused || isFilled
              ? const Color(0xff26A69A)
              : Colors.grey.shade400,
          width: isFocused ? 2 : 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  /// ✅ VERIFY OTP API – DEMO MODE
  Future<void> _verifyOtpApi() async {
    String otp = _otpController.text;

    if (otp.length != 6) {
      _snack("Enter valid OTP", false);
      return;
    }

    setState(() => isLoading = true);

    try {
      /* // API verification commented for future implementation
      final prefs = await SharedPreferences.getInstance();
      // ... LoginApi.verifyOtp ...
      */

      _snack("OTP verified successfully (Demo)", true);

      await Future.delayed(const Duration(milliseconds: 500));

      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      debugPrint("VERIFY OTP ERROR => $e");
      if (mounted) _snack("Server error", false);
    }

    if (mounted) {
      setState(() => isLoading = false);
    }
  }

  Future<void> _resendOtpApi() async {
    setState(() => isLoading = true);

    try {
      /* // Resend OTP API commented for future implementation
      // ... LoginApi.sendOtp ...
      */

      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        _snack("OTP Resent Successfully (Demo)", true);
        listenForCode();
        startTimer();
      }
    } catch (e) {
      debugPrint("RESEND OTP ERROR => $e");
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
