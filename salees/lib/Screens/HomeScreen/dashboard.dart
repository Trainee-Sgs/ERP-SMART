import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widget/custome_buttombar.dart';
import '../LeadScreen/lead_management.dart';
import 'product_screen.dart';
import '../InvoiceScreen/invoice_dashboard.dart';
import 'report_screen.dart';
import '../DrawerScreen/drawer.dart';
import '../PaymentScreen/payment.dart';

class SalesDashboard extends StatefulWidget {
  const SalesDashboard({super.key});

  @override
  State<SalesDashboard> createState() => _SalesDashboardState();
}

class _SalesDashboardState extends State<SalesDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E3B9E),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white, size: 24.sp),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          'Sales Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white, size: 24.sp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 24.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1.5,
              children: [
                _buildStatCard(
                  'Total Sales',
                  '₹50,000',
                  '+12.5%',
                  Icons.trending_up,
                  const Color(0xFF00BFA5),
                ),
                _buildStatCard(
                  'Orders',
                  '160',
                  '+8.5%',
                  Icons.shopping_cart,
                  const Color(0xFF673AB7),
                ),
                _buildStatCard(
                  'Customers',
                  '80',
                  '+14.5%',
                  Icons.people,
                  const Color(0xFF3F51B5),
                ),
                _buildStatCard(
                  'Invoices',
                  '4',
                  '-2.5%',
                  Icons.description,
                  const Color(0xFFFF9800),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Quick Actions
            Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF333333),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10.r,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickAction(
                    Icons.bar_chart,
                    'Lead',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LeadManagementScreen(),
                      ),
                    ),
                  ),
                  _buildQuickAction(
                    Icons.inventory_2,
                    'Product',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductScreen(),
                      ),
                    ),
                  ),
                  _buildQuickAction(
                    Icons.description,
                    'Invoice',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InvoiceDashboardScreen(),
                      ),
                    ),
                  ),
                  _buildQuickAction(
                    Icons.account_balance_wallet,
                    'Payment',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Report Bar
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportScreen()),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFD32F2F),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Report',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Sales Overview
            _buildSectionContainer(
              'Sales Overview',
              SizedBox(
                height: 200.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildBar(100.h, const Color(0xFF00BFA5), 'Mon'),
                    _buildBar(60.h, const Color(0xFF3F51B5), 'Tue'),
                    _buildBar(80.h, const Color(0xFF673AB7), 'Wed'),
                    _buildBar(140.h, const Color(0xFFFF9800), 'Thurs'),
                    _buildBar(120.h, const Color(0xFFFFCC33), 'Fri'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Order Status
            _buildSectionContainer(
              'Order Status',
              SizedBox(
                height: 200.h,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 140.r,
                              height: 140.r,
                              child: CircularProgressIndicator(
                                value: 0.7,
                                strokeWidth: 20.w,
                                backgroundColor: Colors.cyan.withOpacity(0.2),
                                color: Colors.cyan,
                              ),
                            ),
                            SizedBox(
                              width: 100.r,
                              height: 100.r,
                              child: CircularProgressIndicator(
                                value: 0.5,
                                strokeWidth: 20.w,
                                backgroundColor: Colors.green.withOpacity(0.2),
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 60.r,
                              height: 60.r,
                              child: CircularProgressIndicator(
                                value: 0.3,
                                strokeWidth: 20.w,
                                backgroundColor: Colors.orange.withOpacity(0.2),
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _LegendItem(color: Colors.cyan, label: 'Completed'),
                          _LegendItem(color: Colors.green, label: 'Process'),
                          _LegendItem(color: Colors.orange, label: 'Pending'),
                          _LegendItem(color: Colors.redAccent, label: 'Reject'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 80.h), // Space for bottom bar
          ],
        ),
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 0),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String percent,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 20.sp),
              ),
              Row(
                children: [
                  Icon(
                    percent.startsWith('+')
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: Colors.white,
                    size: 12.sp,
                  ),
                  Text(
                    percent,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: const Color(0xFF2E3B9E),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: Colors.white, size: 24.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionContainer(String title, Widget child) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10.r),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          child,
        ],
      ),
    );
  }

  Widget _buildBar(double height, Color color, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 20.w,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(fontSize: 10.sp, color: Colors.grey),
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Container(
            width: 12.r,
            height: 12.r,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
