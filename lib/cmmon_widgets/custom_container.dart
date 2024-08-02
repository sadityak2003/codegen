import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key, this.icon, required this.onTap, required this.color, required this.width, required this.height, required this.text,
  });

  final IconData? icon;
  final Color color;
  final VoidCallback onTap;
  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(color: Colors.grey.shade700)),
              const SizedBox(width: 10),
              Icon(icon, color: color),
            ],
          ),
        ),
      ),
    );
  }
}