part of 'linking_card_bloc.dart';

abstract class LinkingCardEvent extends Equatable {
  const LinkingCardEvent();

  @override
  List<Object> get props => [];
}

class InitialLinkingCardEvent extends LinkingCardEvent {}