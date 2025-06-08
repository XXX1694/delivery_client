part of 'orders_history_bloc.dart';

enum OrdersHistoryStatus { initial, loading, success, failure }

class OrdersHistoryState extends Equatable {
  
  final OrdersHistoryStatus status;

  const OrdersHistoryState({
    this.status = OrdersHistoryStatus.initial,
  });

  @override
  List<Object?> get props => [status];

  bool get isInitial => status == OrdersHistoryStatus.initial;
  bool get isLoading => status == OrdersHistoryStatus.loading;
  bool get isSuccess => status == OrdersHistoryStatus.success;
  bool get isFailure => status == OrdersHistoryStatus.failure;

  OrdersHistoryState copyWith({
    OrdersHistoryStatus? status,
  }) {
    return OrdersHistoryState(
      status: status ?? this.status,
    );
  }
}