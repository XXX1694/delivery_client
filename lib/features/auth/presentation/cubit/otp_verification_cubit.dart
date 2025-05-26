import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:delivery_client/features/auth/presentation/cubit/otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  final AuthRepository _authRepository;
  final String phoneNumber;
  Timer? _resendTimer;

  OtpVerificationCubit({
    required AuthRepository authRepository,
    required this.phoneNumber,
  }) : _authRepository = authRepository,
       super(const OtpVerificationState()) {
    _startResendTimer();
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.resendTime > 0) {
        emit(state.copyWith(resendTime: state.resendTime - 1));
      } else {
        emit(state.copyWith(canResend: true));
        timer.cancel();
      }
    });
  }

  void updateOtp(String otp) {
    emit(state.copyWith(otp: otp));
  }

  Future<void> verifyOtp() async {
    if (state.otp.length != 4) return;

    emit(state.copyWith(status: OtpVerificationStatus.loading));

    try {
      await _authRepository.verifyOtp(phoneNumber, state.otp);
      emit(state.copyWith(status: OtpVerificationStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: OtpVerificationStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> resendOtp() async {
    if (!state.canResend) return;

    emit(
      state.copyWith(
        canResend: false,
        resendTime: 30,
        errorMessage: null,
        status: OtpVerificationStatus.loading,
      ),
    );

    try {
      await _authRepository.resendOtp(phoneNumber);
      emit(state.copyWith(status: OtpVerificationStatus.initial));
      _startResendTimer();
    } catch (e) {
      emit(
        state.copyWith(
          status: OtpVerificationStatus.failure,
          errorMessage: e.toString(),
          canResend: true,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }
}
