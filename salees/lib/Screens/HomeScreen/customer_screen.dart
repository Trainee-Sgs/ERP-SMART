import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widget/custome_buttombar.dart';
import 'add_customer_screen.dart';
import '../CustomerScreen/edit_customer_screen.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E3B9E),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Customer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20.sp),
                contentPadding: EdgeInsets.symmetric(vertical: 0.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: const BorderSide(color: Color(0xFF2E3B9E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: const BorderSide(color: Color(0xFF2E3B9E)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Icon(Icons.access_time, size: 20.sp, color: Colors.grey[700]),
                SizedBox(width: 8.w),
                Text(
                  'Recent',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                _buildCustomerCard('Sowmiya'),
                _buildCustomerCard('Tamil'),
                _buildCustomerCard('Sowmiya'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 56.w,
        height: 56.h,
        child: FloatingActionButton(
          onPressed: () => showAddCustomerPopup(context),
          backgroundColor: const Color(0xFF2E3B9E),
          child: Icon(Icons.add, color: Colors.white, size: 30.sp),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 1),
    );
  }

  Widget _buildCustomerCard(String name) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: const Color(0xFF2E3B9E).withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2E3B9E),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => showEditCustomerPopup(
                  context,
                  name: name,
                  email: 'Sowmiya@gmail.com',
                  phone: '+91 9876543210',
                  location: 'Irugur',
                ),
                icon: Icon(
                  Icons.edit_note,
                  color: const Color(0xFF2E3B9E),
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.delete_outline, color: Colors.redAccent, size: 22.sp),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2FF),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Order',
                      style: TextStyle(color: Colors.black87, fontSize: 13.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '15',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Total spend',
                      style: TextStyle(color: Colors.black87, fontSize: 13.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '₹45,000',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.call_outlined, size: 18.sp),
                  label: Text('Call', style: TextStyle(fontSize: 14.sp)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF2E3B9E),
                    side: const BorderSide(color: Color(0xFF2E3B9E)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.email_outlined, size: 18.sp),
                  label: Text('Email', style: TextStyle(fontSize: 14.sp)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E3B9E),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
