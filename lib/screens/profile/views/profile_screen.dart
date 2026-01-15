import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/components/list_tile/divider_list_tile.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/screen_export.dart';

import 'components/profile_card.dart';
import 'components/profile_menu_item_list_tile.dart';
import 'components/subscription_card.dart';
import 'profile_details_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Summary Card - Clickable
              ProfileCard(
                name: "Saad Bin Shabbir",
                email: "info.saadbinshabbir@gmail.com",
                imageSrc: "assets/images/sbs.jpg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileDetailsScreen(),
                    ),
                  );
                },
              ),

              // Starter Plan Card
              const SubscriptionCard(),

              const SizedBox(height: defaultPadding),

              // Account Section
              _buildSectionTitle("Account"),
              _buildMenuItem(
                context,
                "Orders",
                "assets/icons/Order.svg",
                () => Navigator.pushNamed(context, ordersHistoryScreenRoute),
              ),
              _buildMenuItem(
                context,
                "Returns",
                "assets/icons/Return.svg",
                () => Navigator.pushNamed(context, returnsScreenRoute),
              ),
              _buildMenuItem(
                context,
                "Wishlist",
                "assets/icons/Wishlist.svg",
                () => Navigator.pushNamed(context, bookmarkScreenRoute),
              ),
              _buildMenuItem(
                context,
                "Addresses",
                "assets/icons/Address.svg",
                () => Navigator.pushNamed(context, addressesScreenRoute),
              ),
              _buildMenuItem(
                context,
                "Payment",
                "assets/icons/card.svg",
                () => {}, // TODO: Navigate to payment screen
              ),
              _buildMenuItem(
                context,
                "Wallet",
                "assets/icons/Wallet.svg",
                () => Navigator.pushNamed(context, walletScreenRoute),
              ),

              const SizedBox(height: defaultPadding),

              // Personalization Section
              _buildSectionTitle("Personalization"),
              DividerListTileWithTrilingText(
                svgSrc: "assets/icons/Notification.svg",
                title: "Notification",
                trilingText: "Off",
                press: () => Navigator.pushNamed(context, notificationOptionsScreenRoute),
              ),
              _buildMenuItem(
                context,
                "Preferences",
                "assets/icons/Preferences.svg",
                () => Navigator.pushNamed(context, preferencesScreenRoute),
              ),

              const SizedBox(height: defaultPadding),

              // Settings Section
              _buildSectionTitle("Settings"),
              _buildMenuItem(
                context,
                "Language",
                "assets/icons/Language.svg",
                () => Navigator.pushNamed(context, selectLanguageScreenRoute),
              ),
              _buildMenuItem(
                context,
                "Location",
                "assets/icons/Location.svg",
                () => {}, // TODO: Navigate to location screen
              ),

              const SizedBox(height: defaultPadding),

              // Help & Support Section
              _buildSectionTitle("Help & Support"),
              _buildMenuItem(
                context,
                "Get Help",
                "assets/icons/Help.svg",
                () => {}, // TODO: Navigate to help screen
              ),
              _buildMenuItem(
                context,
                "FAQ",
                "assets/icons/FAQ.svg",
                () => {}, // TODO: Navigate to FAQ screen
              ),

              const SizedBox(height: defaultPadding),

              // Logout
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DividerListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/Logout.svg",
                    height: 24,
                    width: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.red,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: const Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      height: 1,
                    ),
                  ),
                  press: () => _showLogoutDialog(context),
                  isShowDivider: false,
                ),
              ),

              const SizedBox(height: defaultPadding * 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String iconPath, VoidCallback onTap) {
    return ProfileMenuListTile(
      text: title,
      svgSrc: iconPath,
      press: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Implement logout logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully')),
                );
              },
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
