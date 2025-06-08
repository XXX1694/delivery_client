import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_events.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc(): super(const PaymentState()) {
    on<InitialPaymentEvent>(_initialPaymentEvent);
  }

  //* InitialPaymentEvent
  Future<void> _initialPaymentEvent(InitialPaymentEvent event, Emitter<PaymentState> emit) async {
    
  }
}