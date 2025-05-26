import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PhoneInputField({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    final phoneFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return SizedBox(
      width: 330,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '+7 (123) 456-78-90',
          hintStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        cursorHeight: 32,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Пожалуйста, введите номер телефона';
          }
          // Проверяем, полностью ли заполнен номер через форматтер
          if (!phoneFormatter.isFill()) {
            return 'Введите номер телефона полностью';
          }
          return validator?.call(value);
        },
        inputFormatters: [phoneFormatter],
      ),
    );
  }
}
