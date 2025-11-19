import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            color: Color(0xFFA7E9E0),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, size: 80, color: Colors.white),
        ),
        const SizedBox(height: 24),
        const Text(
          'No tasks yet',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4A4A4A),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Add a task to get started',
          style: TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)),
        ),
      ],
    );
  }
}
