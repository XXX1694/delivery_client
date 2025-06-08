part of 'linking_card_bloc.dart';

enum LinkingCardStatus { initial, loading, success, failure }

class LinkingCardState extends Equatable {
  
  final LinkingCardStatus status;

  const LinkingCardState({
    this.status = LinkingCardStatus.initial,
  });

  @override
  List<Object?> get props => [status];

  bool get isInitial => status == LinkingCardStatus.initial;
  bool get isLoading => status == LinkingCardStatus.loading;
  bool get isSuccess => status == LinkingCardStatus.success;
  bool get isFailure => status == LinkingCardStatus.failure;

  LinkingCardState copyWith({
    LinkingCardStatus? status,
  }) {
    return LinkingCardState(
      status: status ?? this.status,
    );
  }
}