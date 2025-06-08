
import 'package:delivery_client/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key, required this.title, required this.image, this.isSelected = false});

  final String title;
  final String image;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 10).copyWith(left: 10, right: 28),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Color(0xFFeff0fa), border: Border.all(color: Colors.white)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, border: Border.all(color: Colors.white, width: 1)),
            child: SvgPicture.asset(image),
          ),
          SizedBox(width: 12),
          Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          Spacer(),

          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? mainColor : Color(0xFFDADADA)),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFeff0fa)),
              child: Container(margin: EdgeInsets.all(3), width: 16, height: 16, decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? mainColor : Colors.transparent)),
            ),
          ),
        ],
      ),
    );
  }
}
