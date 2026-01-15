import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../models/cart_item_model.dart';
import 'network_image_with_loader.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.cartItem,
    this.onQuantityChanged,
    this.onRemove,
  });

  final CartItemModel cartItem;
  final Function(int)? onQuantityChanged;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultBorderRadious),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultBorderRadious),
            child: SizedBox(
              height: 80,
              width: 80,
              child: NetworkImageWithLoader(
                cartItem.product.image,
                radius: defaultBorderRadious,
              ),
            ),
          ),
          const SizedBox(width: defaultPadding),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand Name
                Text(
                  cartItem.product.brandName.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 10,
                        color: blackColor60,
                      ),
                ),
                const SizedBox(height: 4),

                // Product Title
                Text(
                  cartItem.product.title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // Price Row
                Row(
                  children: [
                    // Current Price
                    Text(
                      "\$${cartItem.product.priceAfetDiscount ?? cartItem.product.price}",
                      style: const TextStyle(
                        color: Color(0xFF31B0D8), // Blue color
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Old Price (if discounted)
                    if (cartItem.product.priceAfetDiscount != null)
                      Text(
                        "\$${cartItem.product.price}",
                        style: const TextStyle(
                          color: blackColor60,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          // Quantity Controls
          Column(
            children: [
              // Remove button
              IconButton(
                onPressed: onRemove,
                icon: SvgPicture.asset(
                  "assets/icons/Delete.svg",
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    errorColor,
                    BlendMode.srcIn,
                  ),
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),

              // Quantity
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: lightGreyColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Qty: ${cartItem.quantity}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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
