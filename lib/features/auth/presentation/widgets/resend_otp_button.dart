import 'package:delivery_client/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ResendOtpButton extends StatelessWidget {
  final bool canResend;
  final int resendTime;
  final VoidCallback onResend;

  const ResendOtpButton({
    super.key,
    required this.canResend,
    required this.resendTime,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: canResend ? onResend : null,
      child: Text(
        canResend ? 'Отправить повторно' : 'Повторить через $resendTime сек',
        style: TextStyle(
          color: canResend ? mainColor : Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}
