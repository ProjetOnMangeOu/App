import 'package:flutter/material.dart';

class OMGUButtons extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OMGUButtons({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(999), // Pour que l'effet de ripple suive la forme du bouton
      child: Container(
        width: 415,
        height: 39,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: ShapeDecoration(
                color: Color(0xFFFFB84C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F0A0A0A),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}