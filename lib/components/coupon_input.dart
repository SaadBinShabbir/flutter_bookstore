import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CouponInput extends StatelessWidget {
  const CouponInput({
    super.key,
    this.controller,
    this.onApply,
  });

  final TextEditingController? controller;
  final VoidCallback? onApply;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: BorderRadius.circular(defaultBorderRadious),
      ),
      child: Row(
        children: [
          // Coupon Icon
          SvgPicture.asset(
            "assets/icons/Coupon.svg",
            height: 24,
            colorFilter: const ColorFilter.mode(
              blackColor60,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: defaultPadding),

          // Text Field
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Type coupon code",
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),

          // Apply Button
          TextButton(
            onPressed: onApply,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Apply",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
