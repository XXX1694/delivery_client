import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_events.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(): super(const ChatState()) {
    on<InitialChatEvent>(_initialChatEvent);
  }

  //* InitialChatEvent
  Future<void> _initialChatEvent(InitialChatEvent event, Emitter<ChatState> emit) async {
    
  }
}