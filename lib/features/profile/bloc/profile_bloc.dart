import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_events.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(): super(const ProfileState()) {
    on<InitialProfileEvent>(_initialProfileEvent);
  }

  //* InitialProfileEvent
  Future<void> _initialProfileEvent(InitialProfileEvent event, Emitter<ProfileState> emit) async {
    
  }
}