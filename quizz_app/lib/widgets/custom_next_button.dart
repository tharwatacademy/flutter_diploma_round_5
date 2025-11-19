import 'package:flutter/material.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({
    super.key,
    required this.pageController,
    required this.pageCount,
    this.onComplete,
  });
  final PageController pageController;
  final int pageCount;
  final VoidCallback? onComplete;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (pageController.page!.toInt() < pageCount - 1) {
          pageController.nextPage(
            duration: Duration(milliseconds: 600),
            curve: Curves.linear,
          );
        } else {
          onComplete?.call();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: ShapeDecoration(
          color: const Color(0xFF8D83FF) /* SECONDARY-VIOLET */,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 11,
          children: [
            Text(
              'Next',
              style: TextStyle(
                color: Colors.white /* MAINE-WHITE */,
                fontSize: 16,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }
}
