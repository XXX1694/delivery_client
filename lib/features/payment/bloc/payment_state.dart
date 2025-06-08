part of 'payment_bloc.dart';

enum PaymentStatus { initial, loading, success, failure }

class PaymentState extends Equatable {
  
  final PaymentStatus status;

  const PaymentState({
    this.status = PaymentStatus.initial,
  });

  @override
  List<Object?> get props => [status];

  bool get isInitial => status == PaymentStatus.initial;
  bool get isLoading => status == PaymentStatus.loading;
  bool get isSuccess => status == PaymentStatus.success;
  bool get isFailure => status == PaymentStatus.failure;

  PaymentState copyWith({
    PaymentStatus? status,
  }) {
    return PaymentState(
      status: status ?? this.status,
    );
  }
}