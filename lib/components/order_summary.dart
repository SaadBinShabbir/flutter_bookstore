import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/cart_item_model.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.cartItems,
    this.discount = 0,
    this.shippingFee = 0,
    this.vat = 0,
  });

  final List<CartItemModel> cartItems;
  final double discount;
  final double shippingFee;
  final double vat;

  double get subtotal => cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  double get total => subtotal + shippingFee - discount + vat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: blackColor20),
        borderRadius: BorderRadius.circular(defaultBorderRadious),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "Order Summary",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: defaultPadding),

          // Subtotal
          _buildSummaryRow("Subtotal", "\$${subtotal.toStringAsFixed(0)}"),

          // Shipping Fee
          _buildSummaryRow(
            "Shipping Fee",
            shippingFee == 0 ? "Free" : "\$${shippingFee.toStringAsFixed(0)}",
            valueColor: shippingFee == 0 ? successColor : null,
          ),

          // Discount
          if (discount > 0)
            _buildSummaryRow("Discount", "-\$${discount.toStringAsFixed(0)}"),

          // Divider
          const Divider(height: defaultPadding * 2),

          // Total
          _buildSummaryRow(
            "Total (Include of VAT)",
            "\$${total.toStringAsFixed(0)}",
            isBold: true,
          ),

          // VAT
          if (vat > 0)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Estimated VAT: \$${vat.toStringAsFixed(0)}",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: blackColor60,
                    ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {Color? valueColor, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: blackColor80,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: valueColor ?? (isBold ? blackColor : blackColor80),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
