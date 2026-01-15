import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/cart_item_card.dart';
import '../../components/coupon_input.dart';
import '../../components/order_summary.dart';
import '../../constants.dart';
import '../../models/cart_item_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _couponController = TextEditingController();
  late List<CartItemModel> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = List.from(demoCartItems); // Copy to allow modifications
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _applyCoupon() {
    // TODO: Implement coupon logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Coupon applied!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Page Title
                  Text(
                    "Review your order",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: defaultPadding),

                  // Cart Items List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemCard(
                        cartItem: cartItems[index],
                        onRemove: () => _removeItem(index),
                      );
                    },
                  ),

                  const SizedBox(height: defaultPadding),

                  // Coupon Section
                  Text(
                    "Your Coupon code",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  CouponInput(
                    controller: _couponController,
                    onApply: _applyCoupon,
                  ),

                  const SizedBox(height: defaultPadding),

                  // Order Summary
                  OrderSummary(
                    cartItems: cartItems,
                    discount: 10, // Example discount
                    shippingFee: 0, // Free shipping
                    vat: 5, // Example VAT
                  ),

                  const SizedBox(height: defaultPadding * 2), // Space for bottom button
                ],
              ),
            ),
          ),

          // Bottom Continue Button
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Navigate to checkout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadious),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
