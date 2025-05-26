import 'package:equatable/equatable.dart';

enum OtpVerificationStatus { initial, loading, success, failure }

class OtpVerificationState extends Equatable {
  final String otp;
  final OtpVerificationStatus status;
  final String? errorMessage;
  final int resendTime;
  final bool canResend;

  const OtpVerificationState({
    this.otp = '',
    this.status = OtpVerificationStatus.initial,
    this.errorMessage,
    this.resendTime = 30,
    this.canResend = false,
  });

  OtpVerificationState copyWith({
    String? otp,
    OtpVerificationStatus? status,
    String? errorMessage,
    int? resendTime,
    bool? canResend,
  }) {
    return OtpVerificationState(
      otp: otp ?? this.otp,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      resendTime: resendTime ?? this.resendTime,
      canResend: canResend ?? this.canResend,
    );
  }

  @override
  List<Object?> get props => [otp, status, errorMessage, resendTime, canResend];
}
