part of 'order_details_bloc.dart';

enum OrderDetailsStatus { initial, loading, success, failure }

class OrderDetailsState extends Equatable {
  
  final OrderDetailsStatus status;

  const OrderDetailsState({
    this.status = OrderDetailsStatus.initial,
  });

  @override
  List<Object?> get props => [status];

  bool get isInitial => status == OrderDetailsStatus.initial;
  bool get isLoading => status == OrderDetailsStatus.loading;
  bool get isSuccess => status == OrderDetailsStatus.success;
  bool get isFailure => status == OrderDetailsStatus.failure;

  OrderDetailsState copyWith({
    OrderDetailsStatus? status,
  }) {
    return OrderDetailsState(
      status: status ?? this.status,
    );
  }
}