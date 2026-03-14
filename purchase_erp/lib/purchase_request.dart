import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'widgets/bottom_nav.dart';

class PurchaseRequestScreen extends StatelessWidget {
  const PurchaseRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF2F2F2),

        /// APP BAR
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
          ),
          title: const Text(
            "Purchase Request",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search by PR number or department....",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 26,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.filter_list, size: 32, color: Colors.black),
                ],
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    prCard(width, "PRO01", "IT Department", "Pending"),
                    prCard(width, "PRO02", "Marketing", "Approve"),
                    prCard(width, "PRO03", "Operations", "Rejected"),
                    prCard(width, "PRO04", "HR Department", "Pending"),
                    prCard(width, "PRO02", "Finance", "Approve"),
                    prCard(width, "PRO03", "Operations", "Rejected"),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// BOTTOM NAVBAR
        bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 1),
      ),
    );
  }

  /// PURCHASE REQUEST CARD
  Widget prCard(double width, String id, String dept, String status) {
    Color statusColor;
    Color bgColor;

    switch (status) {
      case "Approve":
        statusColor = Colors.white;
        bgColor = const Color(0xFF0F8C2A);
        break;

      case "Rejected":
        statusColor = Colors.white;
        bgColor = const Color(0xFFAD0F14);
        break;

      default:
        statusColor = Colors.white;
        bgColor = const Color(0xFFC89211);
    }

    return Container(
      margin: EdgeInsets.only(bottom: width * 0.035),
      padding: EdgeInsets.all(width * 0.035),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Row(
        children: [
          /// ICON
          Container(
            width: width * 0.1,
            height: width * 0.1,
            decoration: const BoxDecoration(
              color: Color(0xff3E2C91),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.description, color: Colors.white),
          ),

          SizedBox(width: width * 0.035),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  dept,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),

          /// STATUS BADGE
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: width * 0.012,
            ),

            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const BottomItem({
    super.key,
    required this.icon,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 24, color: selected ? Color(0xff3E2C91) : Colors.grey),

        const SizedBox(height: 4),

        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: selected ? Color(0xff3E2C91) : Colors.grey,
          ),
        ),
      ],
    );
  }
}
