import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectBoxSizeWidget extends StatelessWidget {
  const SelectBoxSizeWidget({super.key, required this.image, required this.title, required this.onTap, required this.isSelected});
  final String image;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(color: isSelected ? Color(0xFFf6f8ff) : Color(0xFFf6f8ff), borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              SvgPicture.asset(image, colorFilter: isSelected ? ColorFilter.mode(Color(0xFF446AEF), BlendMode.srcIn) : null),
              SizedBox(height: 3),
              Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }
}
