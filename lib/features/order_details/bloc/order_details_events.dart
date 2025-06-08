part of 'order_details_bloc.dart';

abstract class OrderDetailsEvent extends Equatable {
  const OrderDetailsEvent();

  @override
  List<Object> get props => [];
}

class InitialOrderDetailsEvent extends OrderDetailsEvent {}