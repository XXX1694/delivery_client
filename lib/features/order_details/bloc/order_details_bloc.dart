import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_details_events.dart';
part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc(): super(const OrderDetailsState()) {
    on<InitialOrderDetailsEvent>(_initialOrderDetailsEvent);
  }

  //* InitialOrderDetailsEvent
  Future<void> _initialOrderDetailsEvent(InitialOrderDetailsEvent event, Emitter<OrderDetailsState> emit) async {
    
  }
}