import 'package:flutter/material.dart';
import 'package:purchase_erp/create_pr.dart';

class RFQDetailsScreen extends StatefulWidget {
  const RFQDetailsScreen({super.key});

  @override
  State<RFQDetailsScreen> createState() => _RFQDetailsScreenState();
}

class _RFQDetailsScreenState extends State<RFQDetailsScreen> {
  String? selectedSupplier;

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
        title: const Text(
          "RFQ details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryCard(width),
                    SizedBox(height: height * 0.02),
                    _buildItemsCard(width),
                    SizedBox(height: height * 0.02),
                    _buildSupplierQuotationsCard(width),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ),
            _buildBottomAction(width, height),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(double width) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "RFQ001",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Office Furniture",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffD1F3F9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Open",
                  style: TextStyle(
                    color: Color(0xff1A8D9E),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: width * 0.05),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PR Number",
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    const Text(
                      "PR002",
                      style: TextStyle(
                        color: Color(0xff3B2B96),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    const Text(
                      "2026-03-08",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemsCard(double width) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          const Text(
            "Items",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: width * 0.05),
          _buildItemRow("Office Chairs", "Ergonomic chairs", "15"),
          SizedBox(height: width * 0.06),
          _buildItemRow("Desks", "Standing desks", "10"),
        ],
      ),
    );
  }

  Widget _buildItemRow(String title, String subtitle, String qty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        Text(
          "Quantity: $qty",
          style: TextStyle(color: Colors.grey[800], fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildSupplierCardAt(
    int index,
    double width,
    String name,
    String rating,
    String price,
    String delivery,
  ) {
    // Unique identifier for selection by combining name and index to avoid collisions
    final String identifier = "$name-$index";
    final bool isSelected = selectedSupplier == identifier;

    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        if (isSelected) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff3B2B96),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "Selected",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFD700),
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      color: Color(0xff3B2B96),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Delivery $delivery",
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          if (!isSelected) ...[
            SizedBox(height: width * 0.04),
            Center(
              child: SizedBox(
                width: width * 0.6,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3B2B96),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedSupplier = identifier;
                    });
                  },
                  child: const Text(
                    "Select Supplier",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSupplierQuotationsCard(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            "Supplier Quotations",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        _buildSupplierCardAt(
          0,
          width,
          "Supplier A",
          "4.5",
          "₹50,000",
          "3 days",
        ),
        SizedBox(height: width * 0.04),
        _buildSupplierCardAt(
          1,
          width,
          "Supplier B",
          "4.6",
          "₹45,000",
          "5 days",
        ),
        SizedBox(height: width * 0.04),
        _buildSupplierCardAt(
          2,
          width,
          "Supplier B",
          "4.6",
          "₹45,000",
          "5 days",
        ),
      ],
    );
  }

  Widget _buildBottomAction(double width, double height) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xffEEEEEE))),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff3B2B96),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePurchaseRequestScreen(),
              ),
            );
          },
          child: const Text(
            "Create Purchase Order",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
