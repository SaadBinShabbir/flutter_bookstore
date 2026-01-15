import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/components/order_components.dart';
import 'package:shop/constants.dart';

class CanceledOrdersScreen extends StatelessWidget {
  const CanceledOrdersScreen({super.key});

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
          "Canceled",
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
          child: ListView(
            children: const [
              CanceledOrderCard(
                orderId: "#FDS6398220",
                orderDate: "Jun 10, 2021",
                products: [
                  ProductItem(
                    image: "assets/images/product1.png",
                    brand: "LIPSY LONDON",
                    name: "Straight Kurta With Side Slits",
                    price: "\$49.99",
                    oldPrice: "\$79.99",
                  ),
                ],
              ),
              SizedBox(height: defaultPadding),
              CanceledOrderCard(
                orderId: "#FDS6398221",
                orderDate: "Jun 15, 2021",
                products: [
                  ProductItem(
                    image: "assets/images/product2.png",
                    brand: "ZARA",
                    name: "Floral Print Maxi Dress",
                    price: "\$89.99",
                    oldPrice: null,
                  ),
                  ProductItem(
                    image: "assets/images/product3.png",
                    brand: "H&M",
                    name: "Cotton T-Shirt",
                    price: "\$24.99",
                    oldPrice: "\$34.99",
                  ),
                ],
              ),
              SizedBox(height: defaultPadding),
              CanceledOrderCard(
                orderId: "#FDS6398222",
                orderDate: "Jun 18, 2021",
                products: [
                  ProductItem(
                    image: "assets/images/product4.png",
                    brand: "NIKE",
                    name: "Sports Sneakers",
                    price: "\$129.99",
                    oldPrice: "\$159.99",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CanceledOrderCard extends StatelessWidget {
  const CanceledOrderCard({
    super.key,
    required this.orderId,
    required this.orderDate,
    required this.products,
  });

  final String orderId;
  final String orderDate;
  final List<ProductItem> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Card Header
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderId,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Placed on $orderDate",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/icons/miniRight.svg",
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!.withOpacity(0.4),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),

          // Progress Tracker
          const CanceledOrderProgressTracker(),

          // Products List
          ...products.map((product) => ProductListItem(product: product)),

          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

class CanceledOrderProgressTracker extends StatelessWidget {
  const CanceledOrderProgressTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
      child: Row(
        children: [
          _buildProgressStep("Ordered", true, true), // Green check
          _buildProgressLine(true, true), // Green line
          _buildProgressStep("Processing", true, true), // Green check
          _buildProgressLine(true, false), // Red line
          _buildProgressStep("Packed", false, true), // Red circle
          _buildProgressLine(false, false), // Red line
          _buildProgressStep("Shipped", false, true), // Red circle
          _buildProgressLine(false, false), // Red line
          _buildProgressStep("Canceled", false, false), // Red cross
        ],
      ),
    );
  }

  Widget _buildProgressStep(String label, bool isCompleted, bool isGreen) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isGreen ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCompleted ? Icons.check : Icons.close,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isGreen ? Colors.green : Colors.red,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressLine(bool isGreen, bool isBeforeCancel) {
    return Container(
      height: 2,
      width: 20,
      color: isGreen ? Colors.green : Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
