import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<void> verifyOtp(String phoneNumber, String otp);
  Future<void> resendOtp(String phoneNumber);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    try {
      await _dio.post(
        '/auth/verify-otp',
        data: {'phone_number': phoneNumber, 'otp': otp},
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw 'Invalid OTP code';
      } else if (e.response?.statusCode == 404) {
        throw 'Phone number not found';
      } else {
        throw 'Failed to verify OTP. Please try again.';
      }
    }
  }

  @override
  Future<void> resendOtp(String phoneNumber) async {
    try {
      await _dio.post('/auth/resend-otp', data: {'phone_number': phoneNumber});
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw 'Phone number not found';
      } else {
        throw 'Failed to resend OTP. Please try again.';
      }
    }
  }
}
