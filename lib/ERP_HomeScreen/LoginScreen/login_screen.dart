import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../WIdgets/snack_bar.dart';
import 'signup_screen.dart';
import '../dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _phone = TextEditingController();
  final _pass = TextEditingController();
  bool _hide = true, _remember = false, _loading = false, _ok = false;

  @override
  void dispose() {
    _phone.dispose();
    _pass.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) {
      ErpSnackbar.error(context, 'Please fix the errors in the form.');
      return;
    }
    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 1400));
    setState(() {
      _loading = false;
      _ok = true;
    });

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
    ErpSnackbar.success(context, 'Access granted!', title: 'Welcome Back');
  }

  @override
  Widget build(BuildContext context) => _Bg(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400.w),
              child: FadeInUp(
                duration: const Duration(milliseconds: 700),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      const _Logo(),
                      SizedBox(height: 48.h),
                      _Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _TitleBlock(
                              'Sign In',
                              'Welcome back to your workspace',
                            ),
                            SizedBox(height: 32.h),
                            _Input(
                              ctrl: _phone,
                              label: 'MOBILE NUMBER',
                              hint: '98765 43210',
                              icon: Icons.phone_android_rounded,
                              keyboardType: TextInputType.phone,
                              validator: (v) => v!.length == 10
                                  ? null
                                  : 'Enter 10-digit number',
                            ),
                            SizedBox(height: 20.h),
                            _Input(
                              ctrl: _pass,
                              label: 'PASSWORD',
                              hint: '••••••••',
                              icon: Icons.lock_outline_rounded,
                              hide: _hide,
                              suffix: _EyeBtn(
                                _hide,
                                () => setState(() => _hide = !_hide),
                              ),
                              validator: (v) =>
                                  v!.length >= 6 ? null : 'Min 6 characters',
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                      height: 20.w,
                                      child: Checkbox(
                                        value: _remember,
                                        onChanged: (v) =>
                                            setState(() => _remember = v!),
                                        activeColor: const Color(0xFF2979FF),
                                        side: const BorderSide(
                                          color: Color(0xFFE2E8F0),
                                          width: 1.5,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      'Remember me',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 13.sp,
                                        color: const Color(0xFF64748B),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Forgot?',
                                    style: GoogleFonts.dmSans(
                                      fontSize: 13.sp,
                                      color: const Color(0xFF2979FF),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 32.h),
                            _Btn(
                              label: _ok ? 'ACCESS GRANTED' : 'SIGN IN',
                              loading: _loading,
                              ok: _ok,
                              onTap: _submit,
                            ),
                            SizedBox(height: 24.h),
                            const _SsoRow(),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "New here? ",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 13.sp,
                                    color: const Color(0xFF64748B),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignupScreen(),
                                    ),
                                  ),
                                  child: Text(
                                    'Create Account',
                                    style: GoogleFonts.dmSans(
                                      fontSize: 13.sp,
                                      color: const Color(0xFF2979FF),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      const _Footer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _Bg extends StatefulWidget {
  final Widget child;
  const _Bg({required this.child});
  @override
  State<_Bg> createState() => _BgState();
}

class _BgState extends State<_Bg> with SingleTickerProviderStateMixin {
  late final _a = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 20),
  )..repeat(reverse: true);
  @override
  void dispose() {
    _a.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      AnimatedBuilder(
        animation: _a,
        builder: (_, __) {
          final t = _a.value;
          return Stack(
            children: [
              Container(color: const Color(0xFFF8FAFC)),
              CustomPaint(size: Size.infinite, painter: _Grid()),
              Positioned(
                left: -180 + 40 * math.sin(t * math.pi * 2),
                top: -120 + 50 * math.cos(t * math.pi * 2),
                child: _Orb(600, const Color(0xFF2979FF), .06),
              ),
              Positioned(
                right: -120 + 30 * math.cos(t * math.pi * 2),
                bottom: -100 + 40 * math.sin(t * math.pi * 2),
                child: _Orb(500, const Color(0xFF64748B), .04),
              ),
            ],
          );
        },
      ),
      widget.child,
    ],
  );
}

class _Grid extends CustomPainter {
  @override
  void paint(Canvas c, Size s) {
    final p = Paint()
      ..color = const Color(0xFF2979FF).withValues(alpha: .03)
      ..strokeWidth = 1;
    for (double x = 0; x < s.width; x += 50)
      c.drawLine(Offset(x, 0), Offset(x, s.height), p);
    for (double y = 0; y < s.height; y += 50)
      c.drawLine(Offset(0, y), Offset(s.width, y), p);
  }

  @override
  bool shouldRepaint(_) => false;
}

class _Orb extends StatelessWidget {
  final double size;
  final Color color;
  final double op;
  const _Orb(this.size, this.color, this.op);
  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [
          color.withValues(alpha: op),
          color.withValues(alpha: 0),
        ],
      ),
    ),
  );
}

class _Logo extends StatelessWidget {
  const _Logo();
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2979FF), Color(0xFF1E293B)],
          ),
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2979FF).withValues(alpha: .2),
              blurRadius: 25.r,
              offset: Offset(0, 10.h),
            ),
          ],
        ),
        child: Icon(Icons.hub_rounded, color: Colors.white, size: 30.sp),
      ),
      SizedBox(height: 16.h),
      Text(
        'Smart ERP',
        style: GoogleFonts.syne(
          fontSize: 24.sp,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF0F172A),
          letterSpacing: -0.5,
        ),
      ),
    ],
  );
}

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(32.r),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.r),
      border: Border.all(color: const Color(0xFFE2E8F0)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.03),
          blurRadius: 40.r,
          offset: Offset(0, 15.h),
        ),
      ],
    ),
    child: child,
  );
}

class _TitleBlock extends StatelessWidget {
  final String title, subtitle;
  const _TitleBlock(this.title, this.subtitle);
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: GoogleFonts.syne(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF0F172A),
        ),
      ),
      SizedBox(height: 6.h),
      Text(
        subtitle,
        textAlign: TextAlign.center,
        style: GoogleFonts.dmSans(
          fontSize: 14.sp,
          color: const Color(0xFF64748B),
        ),
      ),
    ],
  );
}

class _EyeBtn extends StatelessWidget {
  final bool hide;
  final VoidCallback onTap;
  const _EyeBtn(this.hide, this.onTap);
  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: onTap,
    icon: Icon(
      hide ? Icons.visibility_off_outlined : Icons.visibility_outlined,
      size: 20.sp,
      color: const Color(0xFF64748B),
    ),
  );
}

class _Input extends StatelessWidget {
  final TextEditingController ctrl;
  final String label, hint;
  final IconData icon;
  final bool hide;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const _Input({
    required this.ctrl,
    required this.label,
    required this.hint,
    required this.icon,
    this.hide = false,
    this.suffix,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.dmSans(
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF64748B),
          letterSpacing: 1.2,
        ),
      ),
      SizedBox(height: 8.h),
      TextFormField(
        controller: ctrl,
        obscureText: hide,
        keyboardType: keyboardType,
        validator: validator,
        style: GoogleFonts.dmSans(
          fontSize: 15.sp,
          color: const Color(0xFF0F172A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            size: 20.sp,
            color: const Color(0xFF64748B).withValues(alpha: 0.6),
          ),
          suffixIcon: suffix,
          filled: true,
          fillColor: const Color(0xFFF8FAFC),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: const BorderSide(color: Color(0xFF2979FF), width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: const BorderSide(color: Color(0xFFEF4444)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1.5),
          ),
        ),
      ),
    ],
  );
}

class _Btn extends StatelessWidget {
  final String label;
  final bool loading, ok;
  final VoidCallback onTap;
  const _Btn({
    required this.label,
    required this.onTap,
    this.loading = false,
    this.ok = false,
  });
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: loading ? null : onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          gradient: ok
              ? const LinearGradient(
                  colors: [Color(0xFF00A878), Color(0xFF00C990)],
                )
              : const LinearGradient(
                  colors: [Color(0xFF2979FF), Color(0xFF1E60FF)],
                ),
          boxShadow: [
            BoxShadow(
              color: (ok ? const Color(0xFF0D9488) : const Color(0xFF2979FF))
                  .withValues(alpha: .25),
              blurRadius: 15.r,
              offset: Offset(0, 8.h),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: loading
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                style: GoogleFonts.dmSans(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
      ),
    ),
  );
}

class _SsoRow extends StatelessWidget {
  const _SsoRow();
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        children: [
          Expanded(child: Divider(color: const Color(0xFFE2E8F0))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'OR',
              style: GoogleFonts.dmSans(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF64748B).withValues(alpha: 0.5),
              ),
            ),
          ),
          Expanded(child: Divider(color: const Color(0xFFE2E8F0))),
        ],
      ),
      SizedBox(height: 24.h),
      Row(
        children: [
          _ssoBtn('Google', 'assets/google.jpeg'),
          SizedBox(width: 12.w),
          _ssoBtn('Microsoft', 'assets/microsoft.png'),
        ],
      ),
    ],
  );

  Widget _ssoBtn(String label, String asset) => Expanded(
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            width: 20.w,
            height: 20.w,
            errorBuilder: (_, __, ___) => Icon(Icons.login, size: 20.sp),
          ),
          SizedBox(width: 10.w),
          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    ),
  );
}

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.verified_user_rounded,
        size: 14.sp,
        color: const Color(0xFF0D9488),
      ),
      SizedBox(width: 8.w),
      Text(
        'SECURE ENTERPRISE ENCRYPTION',
        style: GoogleFonts.dmSans(
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF64748B).withValues(alpha: 0.6),
          letterSpacing: 1,
        ),
      ),
    ],
  );
}
