import 'package:flutter/material.dart';
import 'package:purchase_erp/Profile/edit_profile';
import 'package:purchase_erp/Profile/settings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xff332088), Color(0xff2F1D7A)],
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            children: [
              /// PROFILE CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.03,
                  horizontal: width * 0.05,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            width: width * 0.22,
                            height: width * 0.22,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffE8E4FF),
                            ),
                            child: Icon(
                              Icons.person,
                              size: width * 0.12,
                              color: const Color(0xff3B2B96),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            "John Doe",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Purchase Executive",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Color(0xff3B2B96),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.025),

              /// DETAILS CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildField("Email", "john.doe@company.com", width),
                    SizedBox(height: height * 0.02),
                    buildField("Phone", "+91 98765 4****", width),
                    SizedBox(height: height * 0.02),
                    buildField("Department", "Purchase", width),
                    SizedBox(height: height * 0.02),
                    buildField("Employee ID", "EMP2024001", width),
                  ],
                ),
              ),

              SizedBox(height: height * 0.025),

              /// SETTINGS CARD
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildSettingsItem(
                      Icons.settings,
                      "Settings",
                      Colors.black87,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      width,
                    ),
                    const Divider(height: 1, indent: 15, endIndent: 15),
                    _buildSettingsItem(
                      Icons.shield,
                      "Privacy & Security",
                      Colors.black87,
                      () {},
                      width,
                    ),
                    const Divider(height: 1, indent: 15, endIndent: 15),
                    _buildSettingsItem(
                      Icons.logout,
                      "Logout",
                      Colors.red,
                      () {},
                      width,
                      isLast: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(String title, String value, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black45, fontSize: width * 0.035),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: width * 0.042,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsItem(
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
    double width, {
    bool isLast = false,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: color, size: 24),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      shape: isLast
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            )
          : null,
    );
  }
}
