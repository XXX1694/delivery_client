
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectAddressItem extends StatelessWidget {
  const SelectAddressItem({super.key, required this.controller, required this.hint, required this.icon, this.iconQuarterTurns = 0});
  final TextEditingController controller;
  final String hint;

  final String icon;

  final int iconQuarterTurns;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Text(controller.text.isEmpty ? hint : controller.text, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
          Spacer(),
          RotatedBox(quarterTurns: iconQuarterTurns, child: SvgPicture.asset(icon, width: 24, height: 24)),
        ],
      ),
    );
  }
}
