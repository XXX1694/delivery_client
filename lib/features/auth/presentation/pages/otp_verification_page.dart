import 'package:delivery_client/core/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:delivery_client/features/auth/presentation/cubit/otp_verification_cubit.dart';
import 'package:delivery_client/features/auth/presentation/cubit/otp_verification_state.dart';
import 'package:delivery_client/features/auth/presentation/widgets/resend_otp_button.dart';

class OtpVerificationPage extends StatelessWidget {
  final String phoneNumber;

  const OtpVerificationPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpVerificationCubit, OtpVerificationState>(
      listener: (context, state) {
        if (state.status == OtpVerificationStatus.success) {
          context.goNamed('create-account');
        }
        if (state.status == OtpVerificationStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage ?? 'Ошибка верификации')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF4F5FF),

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 64,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Align(alignment: Alignment.center, child: Text('Вход', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500))),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CupertinoButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () => context.pop(),
                                    child: Container(
                                      height: 64,
                                      width: 64,
                                      decoration: BoxDecoration(color: Color(0xFF111111).withOpacity(0.02), border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(100)),
                                      child: Center(child: SvgPicture.asset('assets/icons/left_arrow.svg')),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 52),
                          Text('Введите код подтверждения', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                          const SizedBox(height: 12),
                          Text('отправлен на номер $phoneNumber', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.center),
                          const SizedBox(height: 72),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: PinCodeTextField(
                              appContext: context,
                              length: 4,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(12),
                                fieldHeight: 75,
                                fieldWidth: 56,
                                activeFillColor: Colors.black.withOpacity(0.05),
                                selectedFillColor: Colors.black.withOpacity(0.05),
                                inactiveFillColor: Colors.black.withOpacity(0.05),
                                activeColor: mainColor,
                                selectedColor: mainColor,
                                inactiveColor: Colors.black.withOpacity(0.05),
                              ),
                              animationDuration: const Duration(milliseconds: 300),
                              backgroundColor: Colors.transparent,
                              enableActiveFill: true,
                              keyboardType: TextInputType.number,
                              onCompleted: (v) {
                                context.read<OtpVerificationCubit>().updateOtp(v);
                              },
                              onChanged: (value) {
                                context.read<OtpVerificationCubit>().updateOtp(value);
                              },
                              beforeTextPaste: (text) {
                                return true;
                              },
                            ),
                          ),

                          ResendOtpButton(canResend: state.canResend, resendTime: state.resendTime, onResend: () => context.read<OtpVerificationCubit>().resendOtp()),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 24,
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      onPressed:
                          state.status == OtpVerificationStatus.loading
                              ? null
                              : () {
                                // context.read<OtpVerificationCubit>().verifyOtp();
                                context.pushNamed('create-account');
                              },
                      child: Container(
                        height: 64,

                        decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child:
                              state.status == OtpVerificationStatus.loading
                                  ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))
                                  : Text('Продолжить', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
