import 'package:flutter/material.dart';
import 'package:purchase_erp/RFQ/create_rfq';
import 'package:purchase_erp/RFQ/rfq_details.dart';
import 'package:purchase_erp/dashboard.dart';

class RFQScreen extends StatelessWidget {
  const RFQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
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
          "Request for Quotation",
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

      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateRFQScreen()),
          );
        },
        child: Container(
          width: width * 0.16,
          height: width * 0.16,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff3B2B96),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(width * 0.04),

        child: Column(
          children: [
            rfqCard(context, "RFQ001", "Office Furniture", [
              supplier("Supplier A", "₹50,000", "3 days"),
              supplier("Supplier B", "₹45,000", "5 days"),
              supplier("Supplier C", "₹48,000", "4 days"),
            ]),

            SizedBox(height: width * 0.05),

            rfqCard(context, "RFQ002", "IT Equipment", [
              supplier("Tech Solutions", "₹85,000", "7 days"),
              supplier("Digital Store", "₹82,000", "5 days"),
            ]),

            SizedBox(height: width * 0.05),

            rfqCard(context, "RFQ003", "Stationery Items", [
              supplier("Office Mart", "₹12,000", "2 days"),
              supplier("Supplies Co", "₹11,500", "3 days"),
              supplier("Quick Office", "₹13,000", "1 days"),
            ]),
          ],
        ),
      ),
    );
  }

  /// RFQ CARD
  Widget rfqCard(
    BuildContext context,
    String id,
    String category,
    List<Map> suppliers,
  ) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        if (id == "RFQ001") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RFQDetailsScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(width * 0.04),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: width * 0.09,
                  height: width * 0.09,

                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff3B2B96),
                  ),

                  child: const Icon(
                    Icons.description,
                    color: Colors.white,
                    size: 18,
                  ),
                ),

                SizedBox(width: width * 0.03),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      id,
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      category,
                      style: TextStyle(
                        fontSize: width * 0.033,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: width * 0.04),

            Column(
              children: suppliers.map((s) => supplierRow(context, s)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  /// SUPPLIER DATA
  Map supplier(String name, String price, String delivery) {
    return {"name": name, "price": price, "delivery": delivery};
  }

  /// SUPPLIER ROW
  Widget supplierRow(BuildContext context, Map supplier) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: width * 0.03),

      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: width * 0.03,
      ),

      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                supplier["name"],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.038,
                ),
              ),

              SizedBox(height: width * 0.01),

              Text(
                "${supplier["price"]}  |  Delivery: ${supplier["delivery"]}",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: width * 0.032,
                ),
              ),
            ],
          ),

          const Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }
}
