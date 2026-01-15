import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants.dart';

class ProcessingOrdersScreen extends StatelessWidget {
  const ProcessingOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            "assets/icons/Arrow - Left.svg",
            height: 24,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: const Text(
          "Processing",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Processing Orders",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: defaultPadding),
              Expanded(
                child: ListView(
                  children: const [
                    ProcessingOrderCard(
                      orderId: "#ORD-1023",
                      orderDate: "Jan 10, 2024",
                      totalPrice: "\$149.99",
                    ),
                    ProcessingOrderCard(
                      orderId: "#ORD-1024",
                      orderDate: "Jan 11, 2024",
                      totalPrice: "\$89.50",
                    ),
                    ProcessingOrderCard(
                      orderId: "#ORD-1025",
                      orderDate: "Jan 12, 2024",
                      totalPrice: "\$234.75",
                    ),
                    ProcessingOrderCard(
                      orderId: "#ORD-1026",
                      orderDate: "Jan 12, 2024",
                      totalPrice: "\$67.25",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcessingOrderCard extends StatelessWidget {
  const ProcessingOrderCard({
    super.key,
    required this.orderId,
    required this.orderDate,
    required this.totalPrice,
  });

  final String orderId;
  final String orderDate;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderId,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF7C3AED).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Processing",
                  style: TextStyle(
                    color: Color(0xFF7C3AED),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Date: $orderDate",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              Text(
                totalPrice,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
