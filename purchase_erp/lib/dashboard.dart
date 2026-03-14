import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'widgets/bottom_nav.dart';
import 'create_pr.dart';
import 'purchase_orders/purchase_orders.dart';
import 'approvals.dart';
import 'notification.dart';
import 'Profile/profile.dart';
import 'RFQ/request_for_quotation.dart';
import 'Reports/reports_analytics.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Menu",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          return InkWell(
                            onTap: () {
                              Scaffold.of(context).closeDrawer();
                            },
                            child: const Icon(Icons.close, color: Colors.black),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                Divider(color: Colors.grey.shade300, height: 1),

                /// Profile Tile
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.02,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.1,
                        height: width * 0.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: width * 0.06,
                        ),
                      ),
                      SizedBox(width: width * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SMM",
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "+91 74924 88***",
                            style: TextStyle(
                              fontSize: width * 0.035,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  indent: width * 0.05,
                  endIndent: width * 0.05,
                ),

                /// Sales Item
                _buildDrawerItem(Icons.bar_chart, "Sales", width, height),
                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  indent: width * 0.05,
                  endIndent: width * 0.05,
                ),

                /// B2B Item
                _buildDrawerItem(Icons.business_center, "B2B", width, height),
                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  indent: width * 0.05,
                  endIndent: width * 0.05,
                ),

                /// B2C Item
                _buildDrawerItem(Icons.shopping_bag, "B2C", width, height),
                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  indent: width * 0.05,
                  endIndent: width * 0.05,
                ),

                /// Service Item
                _buildDrawerItem(Icons.handyman, "Service", width, height),
                Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  indent: width * 0.05,
                  endIndent: width * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 0),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER + OVERLAP CARDS
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: height * 0.25,
                  width: width,
                  padding: EdgeInsets.only(
                    left: width * 0.05,
                    top: height * 0.06,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Color(0xff332088), Color(0xff2F1D7A)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.05),
                        child: Row(
                          children: [
                            Builder(
                              builder: (context) {
                                return InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ERP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.055 > 22
                                        ? 22
                                        : width * 0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Purchase Management",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.04 > 16
                                        ? 16
                                        : width * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationScreen(),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.notifications_none,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileScreen(),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                radius: 16,
                                // In real app, load profile image here
                                backgroundColor: Colors.white24,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: height * 0.03),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome, Purchase Executive 👋",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.038 > 15 ? 15 : width * 0.038,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff4B3EB8),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(width * 0.05),
                                bottomLeft: Radius.circular(width * 0.05),
                              ),
                            ),
                            child: const Text(
                              "Monthly\nOverview",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// TOP CARDS
                Positioned(
                  bottom: -70,
                  left: width * 0.05,
                  right: width * 0.05,
                  child: Row(
                    children: [
                      Expanded(
                        child: gradientCard(
                          "Total Purchase",
                          "₹ 2,48,500",
                          "+12%",
                          const [Color(0xffF70E37), Color(0xffFF869B)],
                          Icons.receipt,
                        ),
                      ),

                      SizedBox(width: width * 0.04),

                      Expanded(
                        child: gradientCard(
                          "Pending Approvals",
                          "12",
                          "",
                          const [Color(0xff3A00CA), Color(0xff8E60FF)],
                          Icons.access_time_filled,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.11),

            /// TOTAL PR + TOTAL PO
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                children: [
                  Expanded(
                    child: gradientCard("Total PR", "28", "", const [
                      Color(0xff018477),
                      Color(0xff15F3DD),
                    ], Icons.campaign),
                  ),

                  SizedBox(width: width * 0.03),

                  Expanded(
                    child: gradientCard("Total PO", "16", "", const [
                      Color(0xffA8076A),
                      Color(0xffFF7CCD),
                    ], Icons.list_alt),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.02),

            /// QUICK ACTIONS
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Quick Actions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4), // Further reduced gap here
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    childAspectRatio: 0.8,
                    children: [
                      ActionItem(
                        Icons.add,
                        "Create PR",
                        const [Color(0xffF70E37), Color(0xffFF869B)],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CreatePurchaseRequestScreen(),
                            ),
                          );
                        },
                      ),
                      ActionItem(
                        Icons.replay_circle_filled_outlined,
                        "Approvals",
                        const [Color(0xff3A00CA), Color(0xff8E60FF)],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PendingApprovals(),
                            ),
                          );
                        },
                      ),
                      ActionItem(
                        Icons.article_outlined,
                        "RFQ",
                        const [Color(0xff018477), Color(0xff15F3DD)],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RFQScreen(),
                            ),
                          );
                        },
                      ),
                      ActionItem(
                        Icons.local_offer_outlined,
                        "Purchase\nOrders",
                        const [Color(0xffA8076A), Color(0xffFF7CCD)],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PurchaseOrdersScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.02),

            /// REPORTS & ANALYTICS BUTTON
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReportsAnalyticsScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff31217D),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Reports & Analytics",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.03),

            /// ANALYTICS CARD
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Container(
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Purchase Analytics",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1A1A1A),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffF0F0FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                "This Month",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff3B2B96),
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 18,
                                color: Color(0xff3B2B96),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Builder(
                      builder: (context) {
                        // Define the spots once so showingTooltipIndicators references the same data
                        final spots = const [
                          FlSpot(0, 0.4),
                          FlSpot(1, 1.3),
                          FlSpot(2, 0.9),
                          FlSpot(3, 1.9),
                          FlSpot(4, 1.1),
                          FlSpot(5, 2.48),
                        ];
                        final barData = LineChartBarData(
                          isCurved: true,
                          curveSmoothness: 0.35,
                          color: const Color(0xff3B2B96),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              // Highlight the last dot
                              if (index == spots.length - 1) {
                                return FlDotCirclePainter(
                                  radius: 5,
                                  color: const Color(0xff3B2B96),
                                  strokeWidth: 2.5,
                                  strokeColor: Colors.white,
                                );
                              }
                              return FlDotCirclePainter(
                                radius: 3.5,
                                color: Colors.white,
                                strokeWidth: 2,
                                strokeColor: const Color(0xff3B2B96),
                              );
                            },
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff3B2B96).withOpacity(0.35),
                                const Color(0xff3B2B96).withOpacity(0.0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          spots: spots,
                        );

                        return SizedBox(
                          height: 190,
                          child: LineChart(
                            LineChartData(
                              minY: 0,
                              maxY: 3,
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                                horizontalInterval: 1,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: const Color(
                                      0xffE0E0E0,
                                    ).withOpacity(0.5),
                                    strokeWidth: 1,
                                    dashArray: [5, 5],
                                  );
                                },
                              ),
                              borderData: FlBorderData(show: false),
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 1,
                                    reservedSize: 32,
                                    getTitlesWidget: (value, meta) {
                                      if (value > 3 || value < 0)
                                        return const SizedBox();
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 4,
                                        ),
                                        child: Text(
                                          value == 0
                                              ? "0"
                                              : "${value.toInt()}L",
                                          style: const TextStyle(
                                            color: Color(0xff9E9E9E),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 1,
                                    getTitlesWidget: (value, meta) {
                                      const style = TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff3B2B96),
                                      );
                                      switch (value.toInt()) {
                                        case 0:
                                          return const Text(
                                            "Jan",
                                            style: style,
                                          );
                                        case 1:
                                          return const Text(
                                            "Feb",
                                            style: style,
                                          );
                                        case 2:
                                          return const Text(
                                            "Mar",
                                            style: style,
                                          );
                                        case 3:
                                          return const Text(
                                            "Apr",
                                            style: style,
                                          );
                                        case 4:
                                          return const Text(
                                            "May",
                                            style: style,
                                          );
                                        case 5:
                                          return const Text(
                                            "Jun",
                                            style: style,
                                          );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              lineTouchData: LineTouchData(
                                enabled: true,
                                handleBuiltInTouches: true,
                                touchTooltipData: LineTouchTooltipData(
                                  getTooltipColor: (spot) =>
                                      const Color(0xff2D237A),
                                  tooltipBorderRadius: BorderRadius.circular(8),
                                  tooltipPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  getTooltipItems: (touchedSpots) {
                                    return touchedSpots.map((spot) {
                                      return LineTooltipItem(
                                        "₹2.48L",
                                        const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      );
                                    }).toList();
                                  },
                                ),
                              ),
                              // Always show tooltip at the Jun (index 5) data point
                              showingTooltipIndicators: [
                                ShowingTooltipIndicators([
                                  LineBarSpot(barData, 0, spots[5]),
                                ]),
                              ],
                              lineBarsData: [barData],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.03),

            /// ORDER STATUS
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Container(
                padding: EdgeInsets.all(width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order Status",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      height: 180,
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 140,
                                  height: 140,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffDE318A), // Outer Pink
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff2A4FD3), // Blue
                                  ),
                                ),
                                Container(
                                  width: 65,
                                  height: 65,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff9139ED), // Purple
                                  ),
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffD3A422), // Inner Yellow
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 20),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              LegendItem("Rejected", Color(0xffDE318A)),
                              SizedBox(height: 12),
                              LegendItem("Completed", Color(0xff2A4FD3)),
                              SizedBox(height: 12),
                              LegendItem("Pending", Color(0xffD3A422)),
                              SizedBox(height: 12),
                              LegendItem("Process", Color(0xff9139ED)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    );
  }

  Widget gradientCard(
    String title,
    String value,
    String percent,
    List<Color> colors,
    IconData icon,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        // Adjust font sizes based on card width for better responsiveness
        final titleFontSize = cardWidth * 0.11 > 13 ? 13.0 : cardWidth * 0.11;
        final valueFontSize = cardWidth * 0.18 > 22 ? 22.0 : cardWidth * 0.18;

        return Container(
          height: 110,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: colors[0].withOpacity(0.35),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Content
              Padding(
                padding: EdgeInsets.only(
                  left: 14,
                  top: 14,
                  bottom: 14,
                  right: cardWidth * 0.25, // Leave space for icon
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w500,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: valueFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Icon in circular background at top-right
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 18, color: Colors.white),
                ),
              ),

              // Percent at bottom-right
              if (percent.isNotEmpty)
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Text(
                    percent,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    double width,
    double height,
  ) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87, size: width * 0.06),
            SizedBox(width: width * 0.04),
            Text(
              title,
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final List<Color> gradient;
  final VoidCallback? onTap;

  const ActionItem(
    this.icon,
    this.text,
    this.gradient, {
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: width * 0.14,
            height: width * 0.14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(icon, color: Colors.white),
          ),

          const SizedBox(height: 6),

          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final String text;
  final Color color;

  const LegendItem(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),

        const SizedBox(width: 8),

        Text(
          text,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
