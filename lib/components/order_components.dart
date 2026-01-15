import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
  });

  final ProductItem product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.brand,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Pricing
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                product.price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (product.oldPrice != null)
                Text(
                  product.oldPrice!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductItem {
  const ProductItem({
    required this.image,
    required this.brand,
    required this.name,
    required this.price,
    this.oldPrice,
  });

  final String image;
  final String brand;
  final String name;
  final String price;
  final String? oldPrice;
}
