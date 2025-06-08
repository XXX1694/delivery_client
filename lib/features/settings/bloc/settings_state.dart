part of 'settings_bloc.dart';

enum SettingsStatus { initial, loading, success, failure }

class SettingsState extends Equatable {
  
  final SettingsStatus status;

  const SettingsState({
    this.status = SettingsStatus.initial,
  });

  @override
  List<Object?> get props => [status];

  bool get isInitial => status == SettingsStatus.initial;
  bool get isLoading => status == SettingsStatus.loading;
  bool get isSuccess => status == SettingsStatus.success;
  bool get isFailure => status == SettingsStatus.failure;

  SettingsState copyWith({
    SettingsStatus? status,
  }) {
    return SettingsState(
      status: status ?? this.status,
    );
  }
}