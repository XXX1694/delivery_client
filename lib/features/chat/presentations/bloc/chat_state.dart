part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, failure }

class ChatState extends Equatable {
  
  final ChatStatus status;

  const ChatState({
    this.status = ChatStatus.initial,
  });

  @override
  List<Object?> get props => [status];

  bool get isInitial => status == ChatStatus.initial;
  bool get isLoading => status == ChatStatus.loading;
  bool get isSuccess => status == ChatStatus.success;
  bool get isFailure => status == ChatStatus.failure;

  ChatState copyWith({
    ChatStatus? status,
  }) {
    return ChatState(
      status: status ?? this.status,
    );
  }
}