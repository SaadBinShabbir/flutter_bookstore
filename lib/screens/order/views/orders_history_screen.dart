import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/screen_export.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

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
          "Orders",
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
                "Orders history",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: defaultPadding),
              Expanded(
                child: ListView(
                  children: [
                    const OrderStatusTile(
                      title: "Awaiting Payment",
                      iconPath: "assets/icons/card.svg",
                      badgeColor: Colors.yellow,
                      count: 0,
                    ),
                    OrderStatusTile(
                      title: "Processing",
                      iconPath: "assets/icons/Clock.svg",
                      badgeColor: const Color(0xFF7C3AED), // Purple
                      count: 1,
                      onTap: () => Navigator.pushNamed(context, processingOrdersScreenRoute),
                    ),
                    OrderStatusTile(
                      title: "Delivered",
                      iconPath: "assets/icons/Delivery.svg",
                      badgeColor: Colors.blue,
                      count: 5,
                      onTap: () => Navigator.pushNamed(context, deliveredOrdersScreenRoute),
                    ),
                    const OrderStatusTile(
                      title: "Returned",
                      iconPath: "assets/icons/Return.svg",
                      badgeColor: Color(0xFF6366F1), // Indigo
                      count: 2,
                    ),
                    OrderStatusTile(
                      title: "Canceled",
                      iconPath: "assets/icons/Close.svg",
                      badgeColor: Colors.red,
                      count: 2,
                      onTap: () => Navigator.pushNamed(context, canceledOrdersScreenRoute),
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

class OrderStatusTile extends StatelessWidget {
  const OrderStatusTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.badgeColor,
    required this.count,
    this.onTap,
  });

  final String title;
  final String iconPath;
  final Color badgeColor;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            iconPath,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: defaultPadding / 2),
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
          onTap: onTap ?? () {
            // TODO: Navigate to detailed orders list for this status
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}
