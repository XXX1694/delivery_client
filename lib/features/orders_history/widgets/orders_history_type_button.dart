import 'package:delivery_client/core/theme/colors.dart';
import 'package:flutter/material.dart';

class OrdersHistoryTypeButton extends StatelessWidget {
  final bool isCurrent;
  final String title;
  const OrdersHistoryTypeButton({super.key, required this.isCurrent, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: isCurrent ? mainColor : Color(0xFFeff0fa)),
      child: Text(title, style: TextStyle(color: isCurrent ? Colors.white : Color(0xFFA1A1A1), fontSize: 14, fontWeight: FontWeight.w400)),
    );
  }
}