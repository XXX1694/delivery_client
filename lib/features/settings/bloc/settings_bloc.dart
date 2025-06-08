import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_events.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(): super(const SettingsState()) {
    on<InitialSettingsEvent>(_initialSettingsEvent);
  }

  //* InitialSettingsEvent
  Future<void> _initialSettingsEvent(InitialSettingsEvent event, Emitter<SettingsState> emit) async {
    
  }
}