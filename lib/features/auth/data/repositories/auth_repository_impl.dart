import 'package:delivery_client/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:delivery_client/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    await _remoteDataSource.verifyOtp(phoneNumber, otp);
  }

  @override
  Future<void> resendOtp(String phoneNumber) async {
    await _remoteDataSource.resendOtp(phoneNumber);
  }
}
