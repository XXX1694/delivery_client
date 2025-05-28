import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectBoxSizeWidget extends StatelessWidget {
  const SelectBoxSizeWidget({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(color: Color(0xFFf6f8ff), borderRadius: BorderRadius.circular(20)),
      child: Column(children: [SvgPicture.asset(image), SizedBox(height: 3), Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400))]),
    );
  }
}
