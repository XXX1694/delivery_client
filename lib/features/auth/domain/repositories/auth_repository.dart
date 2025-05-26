abstract class AuthRepository {
  Future<void> verifyOtp(String phoneNumber, String otp);
  Future<void> resendOtp(String phoneNumber);
}
