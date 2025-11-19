import 'package:flutter/material.dart';

class HamburgerMenuButtonWidget extends StatelessWidget {
  const HamburgerMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 20, height: 2, color: Colors.black),
                const SizedBox(height: 5),
                Container(width: 20, height: 2, color: Colors.black),
                const SizedBox(height: 5),
                Container(width: 20, height: 2, color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
