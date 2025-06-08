import 'package:flutter/material.dart';

class OrderInformationProcessingType extends StatelessWidget {
  const OrderInformationProcessingType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Получатель', style: TextStyle(color: Color(0xFFA1A1A1), fontWeight: FontWeight.w400, fontSize: 12)),
                Text('Абзал ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black)),
              ],
            ),
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Объем', style: TextStyle(color: Color(0xFFA1A1A1), fontWeight: FontWeight.w400, fontSize: 12)),
                Text("20x100 см", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black)),
              ],
            ),
          ),
        ),
        Expanded(
          child: FittedBox(
            alignment: Alignment.centerRight,
            fit: BoxFit.scaleDown,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xFFFF564A))),
                child: Text('Отменить заказ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFFF564A))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}