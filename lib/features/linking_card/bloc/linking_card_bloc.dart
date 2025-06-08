import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'linking_card_events.dart';
part 'linking_card_state.dart';

class LinkingCardBloc extends Bloc<LinkingCardEvent, LinkingCardState> {
  LinkingCardBloc(): super(const LinkingCardState()) {
    on<InitialLinkingCardEvent>(_initialLinkingCardEvent);
  }

  //* InitialLinkingCardEvent
  Future<void> _initialLinkingCardEvent(InitialLinkingCardEvent event, Emitter<LinkingCardState> emit) async {
    
  }
}