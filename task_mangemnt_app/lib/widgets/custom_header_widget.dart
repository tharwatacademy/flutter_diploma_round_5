import 'package:flutter/material.dart';

class CustomHeaderWidget extends StatelessWidget {
  final String title;

  const CustomHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFA7E9E0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4)),
            ),
            child: const Text(
              'DEBUG',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
