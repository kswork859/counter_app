import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  List<Object> get props => [];
}

class EnableDisableNotification extends SwitchEvents {}

class SlidersEvents extends SwitchEvents {
  final double sliders;

  const SlidersEvents({required this.sliders});

  @override
  List<Object> get props => [sliders];
}
