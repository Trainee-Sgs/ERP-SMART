import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationViewScreen extends StatefulWidget {
  const NotificationViewScreen({super.key});

  @override
  State<NotificationViewScreen> createState() => _NotificationViewScreenState();
}

class _NotificationViewScreenState extends State<NotificationViewScreen> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _allNotifications = [
    {
      'title': 'New Order Recevied',
      'desc': 'Order #1023 placed successfully',
      'time': '2 mins ago',
      'category': 'Order',
      'icon': Icons.shopping_cart_outlined,
      'isToday': true,
      'isUnread': true,
    },
    {
      'title': 'Payment Successful',
      'desc': '₹5,000 received from Raj',
      'time': '1 hour ago',
      'category': 'Payment',
      'icon': Icons.check_circle_outline,
      'isToday': true,
      'isUnread': true,
    },
    {
      'title': 'Invoice Created',
      'desc': 'Invoice #INV-45 generated',
      'time': '3 hour ago',
      'category': 'Invoice',
      'icon': Icons.description_outlined,
      'isToday': true,
      'isUnread': true,
    },
    {
      'title': 'New Order Recevied',
      'desc': 'Order #1023 placed successfully',
      'time': '2 mins ago',
      'category': 'Order',
      'icon': Icons.shopping_cart_outlined,
      'isToday': false,
      'isUnread': false,
    },
    {
      'title': 'Payment Successful',
      'desc': '₹5,000 received from Raj',
      'time': '1 hour ago',
      'category': 'Payment',
      'icon': Icons.check_circle_outline,
      'isToday': false,
      'isUnread': false,
    },
    {
      'title': 'Invoice Created',
      'desc': 'Invoice #INV-45 generated',
      'time': '3 hour ago',
      'category': 'Invoice',
      'icon': Icons.description_outlined,
      'isToday': false,
      'isUnread': false,
    },
  ];

  List<Map<String, dynamic>> get _filteredNotifications {
    if (_selectedFilter == 'All') return _allNotifications;
    return _allNotifications
        .where((n) => n['category'] == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final todayNotifications = _filteredNotifications
        .where((n) => n['isToday'])
        .toList();
    final weekNotifications = _filteredNotifications
        .where((n) => !n['isToday'])
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF26A69A), // Adopt to app color
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.tune, color: Colors.white, size: 24.sp),
            onSelected: (String value) {
              setState(() {
                _selectedFilter = value;
              });
            },
            offset: Offset(0, 45.h),
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
              side: BorderSide(color: Colors.black12, width: 0.5.w),
            ),
            itemBuilder: (BuildContext context) {
              final List<String> choices = ['Order', 'Invoice', 'Payment', 'Product', 'All'];
              return choices.asMap().entries.expand<PopupMenuEntry<String>>((entry) {
                int index = entry.key;
                String choice = entry.value;
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: choice,
                    height: 40.h,
                    child: Center(
                      child: Text(
                        choice,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  if (index < choices.length - 1)
                    const PopupMenuDivider(height: 0),
                ];
              }).toList();
            },
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Text(
                _selectedFilter == 'All'
                    ? 'You have ${todayNotifications.length} notification today'
                    : _selectedFilter,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            if (todayNotifications.isNotEmpty) ...[
              _buildSectionHeader('Today'),
              ...todayNotifications.map((n) => _buildNotificationItem(n)),
            ],
            if (weekNotifications.isNotEmpty) ...[
              SizedBox(height: 20.h),
              _buildSectionHeader('This Week'),
              ...weekNotifications.map((n) => _buildNotificationItem(n)),
            ],
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> n) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unread Dot
          Container(
            width: 8.w,
            height: 40.h,
            alignment: Alignment.center,
            child: n['isUnread']
                ? Navigator.canPop(context)
                      ? Container(
                          width: 6.r,
                          height: 6.r,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        )
                      : null
                : null,
          ),
          SizedBox(width: 4.w),
          // Icon Container
          Container(
            width: 48.r,
            height: 48.r,
            decoration: BoxDecoration(
              color: const Color(
                0xFFE0F7FA,
              ), // Light teal background from image
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              n['icon'],
              color: const Color(0xFF26A69A), // Teal icon color
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      n['title'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      n['time'],
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  n['desc'],
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
