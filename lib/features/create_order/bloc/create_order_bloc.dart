import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_order_events.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  CreateOrderBloc(): super(const CreateOrderState()) {
    on<InitialCreateOrderEvent>(_initialCreateOrderEvent);
  }

  //* InitialCreateOrderEvent
  Future<void> _initialCreateOrderEvent(InitialCreateOrderEvent event, Emitter<CreateOrderState> emit) async {
    
  }
}