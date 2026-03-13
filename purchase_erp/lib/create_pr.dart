import 'package:flutter/material.dart';

class CreatePurchaseRequestScreen extends StatefulWidget {
  const CreatePurchaseRequestScreen({super.key});

  @override
  State<CreatePurchaseRequestScreen> createState() =>
      _CreatePurchaseRequestScreenState();
}

class _CreatePurchaseRequestScreenState
    extends State<CreatePurchaseRequestScreen> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Create Purchase Request",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
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
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: width * 0.04,
                ),
                child: Column(
                  children: [
                    _buildRequestDetailsCard(width),
                    SizedBox(height: width * 0.04),
                    _buildItemsCard(width),
                    SizedBox(height: width * 0.04),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(width),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestDetailsCard(double width) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Request Details",
            style: TextStyle(
              color: Color(0xff3B2B96),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(height: width * 0.03),
          _buildInputLabel("Department"),
          _buildTextField("Enter Department Name"),
          SizedBox(height: width * 0.03),
          _buildInputLabel("PR Number"),
          _buildTextField("Auto-Generated"),
          SizedBox(height: width * 0.03),
          _buildInputLabel("Remarks"),
          _buildTextField("Remarks", maxLines: 3),
        ],
      ),
    );
  }

  Widget _buildItemsCard(double width) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Items",
                style: TextStyle(
                  color: Color(0xff3B2B96),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    itemCount++;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff3B2B96),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.add, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "Add Item",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: width * 0.04),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            separatorBuilder: (context, index) =>
                SizedBox(height: width * 0.04),
            itemBuilder: (context, index) {
              return _buildSingleItem(index, width);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSingleItem(int index, double width) {
    return Container(
      padding: EdgeInsets.all(width * 0.035),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Item ${index + 1}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: width * 0.03),
          _buildInputLabel("Item Name"),
          _buildTextField("Enter Item Name"),
          SizedBox(height: width * 0.03),
          _buildInputLabel("Quantity"),
          _buildTextField("Enter Quantity"),
          SizedBox(height: width * 0.03),
          _buildInputLabel("Required Date"),
          _buildTextField("DD-MM-YYYY"),
          SizedBox(height: width * 0.03),
          _buildInputLabel("Description"),
          _buildTextField("Enter Description"),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(double width) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Save Draft",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: width * 0.03),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3B2B96),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Submitted For Approval"),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                "Submit For Approval",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xff3B2B96)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
