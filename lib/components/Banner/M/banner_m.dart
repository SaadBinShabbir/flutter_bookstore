import 'package:flutter/material.dart';

class BannerM extends StatelessWidget {
  const BannerM(
      {super.key,
      required this.image,
      required this.press,
      required this.children});

  final String image;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(color: Colors.black45),
            ...children,
          ],
        ),
      ),
    );
  }
}
