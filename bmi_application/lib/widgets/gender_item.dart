import 'package:flutter/material.dart';

import 'custom_container.dart';
import 'section_title.dart';

class GenderItem extends StatelessWidget {
  const GenderItem({
    super.key,
    required this.icon,
    required this.data,
    required this.color,
  });

  final IconData icon;
  final String data;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 110),

          SectionTitle(text: data),
        ],
      ),
    );
  }
}
