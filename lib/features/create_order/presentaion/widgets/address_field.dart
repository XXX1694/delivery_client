import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'select_adress/select_address_detailed.dart';

class AddressField extends StatelessWidget {
  const AddressField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
  });
  final TextEditingController controller;
  final String hint;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSelectAdress(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 16),
            Text(
              controller.text.isEmpty ? hint : controller.text,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
