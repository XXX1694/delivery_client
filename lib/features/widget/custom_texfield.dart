import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String? iconPath;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyBoardType;

  const CustomTextField({super.key, required this.hint, this.iconPath, this.controller, this.readOnly = false, this.onTap,this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: const Color(0xFF111111).withOpacity(0.02), borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.white)),
      child: Row(
        children: [
          if (iconPath != null)
            Container(width: 36, height: 36, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)), child: Center(child: SvgPicture.asset(iconPath!))),
          if (iconPath != null) const SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              keyboardType: keyBoardType,
              controller: controller,
              readOnly: readOnly,
              onTap: onTap,
              decoration: InputDecoration(border: InputBorder.none, hintText: hint, hintStyle: const TextStyle(color: Color(0xFFA1A1A1), fontWeight: FontWeight.w400, fontSize: 16)),
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
