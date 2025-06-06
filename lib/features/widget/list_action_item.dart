import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListActionItem extends StatelessWidget {
  const ListActionItem({super.key, required this.title, required this.leftImage, required this.rightImage, required this.onTap, this.leftImagePadding = 12,this.color});

  final String title;

  final String leftImage;
  final String rightImage;
  final double leftImagePadding;
  final Function() onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 12).copyWith(left: 12, right: 28),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Color(0xFFeff0fa), border: Border.all(color:  color ??Colors.white)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(leftImagePadding),
            width: 56,
            height: 56,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, border: Border.all(color: Colors.white, width: 1)),
            child: SvgPicture.asset(leftImage, fit: BoxFit.fill),
          ),
          SizedBox(width: 12),
          Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,color: color ?? Colors.black)),
          Spacer(),
          SvgPicture.asset(rightImage, colorFilter: color != null ?    ColorFilter.mode(color!, BlendMode.srcIn) : null ),
        ],
      ),
    );
  }
}
