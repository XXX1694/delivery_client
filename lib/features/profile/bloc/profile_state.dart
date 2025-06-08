part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  
  final ProfileStatus status;

  const ProfileState({
    this.status = ProfileStatus.initial,
  });

  @override
  List<Object?> get props => [status];

  bool get isInitial => status == ProfileStatus.initial;
  bool get isLoading => status == ProfileStatus.loading;
  bool get isSuccess => status == ProfileStatus.success;
  bool get isFailure => status == ProfileStatus.failure;

  ProfileState copyWith({
    ProfileStatus? status,
  }) {
    return ProfileState(
      status: status ?? this.status,
    );
  }
}