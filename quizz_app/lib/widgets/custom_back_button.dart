import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({super.key, required this.pageController});
  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageController.previousPage(
          duration: Duration(milliseconds: 600),
          curve: Curves.linear,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: const Color(0xFF8D83FF) /* SECONDARY-VIOLET */,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
            Text(
              'Back',
              style: TextStyle(
                color: Colors.white /* MAINE-WHITE */,
                fontSize: 16,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
