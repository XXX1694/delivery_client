import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'orders_history_events.dart';
part 'orders_history_state.dart';

class OrdersHistoryBloc extends Bloc<OrdersHistoryEvent, OrdersHistoryState> {
  OrdersHistoryBloc(): super(const OrdersHistoryState()) {
    on<InitialOrdersHistoryEvent>(_initialOrdersHistoryEvent);
  }

  //* InitialOrdersHistoryEvent
  Future<void> _initialOrdersHistoryEvent(InitialOrdersHistoryEvent event, Emitter<OrdersHistoryState> emit) async {
    
  }
}