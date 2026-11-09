import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/switch/switch_events.dart';
import 'package:counter_app/bloc/switch/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableDisableNotification>(_enableOrDisableNotification);
    on<SlidersEvents>(_slide);
  }
  void _enableOrDisableNotification(
    EnableDisableNotification events,
    Emitter<SwitchStates> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slide(SlidersEvents events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: events.sliders));
  }
}
