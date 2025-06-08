part of 'create_order_bloc.dart';

enum CreateOrderStatus { initial, loading, success, failure }

class CreateOrderState extends Equatable {
  
  final CreateOrderStatus status;

  const CreateOrderState({
    this.status = CreateOrderStatus.initial,
  });

  @override
  List<Object?> get props => [status];

  bool get isInitial => status == CreateOrderStatus.initial;
  bool get isLoading => status == CreateOrderStatus.loading;
  bool get isSuccess => status == CreateOrderStatus.success;
  bool get isFailure => status == CreateOrderStatus.failure;

  CreateOrderState copyWith({
    CreateOrderStatus? status,
  }) {
    return CreateOrderState(
      status: status ?? this.status,
    );
  }
}