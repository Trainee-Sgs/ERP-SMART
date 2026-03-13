import 'package:flutter/material.dart';
import 'package:purchase_erp/dashboard.dart';
import 'package:purchase_erp/widgets/bottom_nav.dart';
import 'package:purchase_erp/purchase_orders/po_opens.dart';

class PurchaseOrdersScreen extends StatelessWidget {
  const PurchaseOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
        backgroundColor: Colors.white,
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
          title: const Text(
            "Purchase Orders",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
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
        ),
        bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 3),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 10),
          child: Column(
            children: [
              /// SEARCH BAR
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
              const SizedBox(height: 16),

              /// STATS GRID
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statCard(
                        width,
                        "Total POs",
                        "10",
                        const Color(0xff9E8B1E),
                        Icons.inventory_2,
                      ),
                      statCard(
                        width,
                        "Approved",
                        "5",
                        const Color(0xff088C29),
                        Icons.unarchive,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statCard(
                        width,
                        "Rejected",
                        "2",
                        const Color(0xffAF1616),
                        Icons.inventory,
                      ),
                      statCard(
                        width,
                        "Total Value",
                        "₹702,000",
                        const Color(0xffB9187D),
                        Icons.account_balance_wallet,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// PO LIST
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    OrderCard("PO001", "ABC Traders", "₹45,000", "Approved"),
                    OrderCard("PO002", "XYZ Suppliers", "₹32,000", "Rejected"),
                    OrderCard("PO003", "Tech Solutions", "₹78,000", "Approved"),
                    OrderCard("PO004", "Office Mart", "₹12,500", "Pending"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// STAT CARD WIDGET
  Widget statCard(
    double width,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Container(
      width: width * 0.44,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 22, color: color),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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

class OrderCard extends StatelessWidget {
  final String orderId;
  final String supplier;
  final String price;
  final String status;

  const OrderCard(
    this.orderId,
    this.supplier,
    this.price,
    this.status, {
    super.key,
  });

  Color statusColor() {
    switch (status) {
      case "Approved":
        return const Color(0xff088C29);
      case "Rejected":
        return const Color(0xffAF1616);
      case "Pending":
        return const Color(0xffDE8143);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        if (orderId == "PO001") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OpensScreen()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: width * 0.035),
        padding: EdgeInsets.all(width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff3B2B96),
              ),
              child: const Icon(
                Icons.inventory_2,
                color: Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderId,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Supplier: $supplier",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
