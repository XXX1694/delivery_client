part of 'orders_history_bloc.dart';

abstract class OrdersHistoryEvent extends Equatable {
  const OrdersHistoryEvent();

  @override
  List<Object> get props => [];
}

class InitialOrdersHistoryEvent extends OrdersHistoryEvent {}