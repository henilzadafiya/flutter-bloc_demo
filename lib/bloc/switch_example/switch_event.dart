import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent {}

class SwitchSlider extends SwitchEvent {
  double slider;

  SwitchSlider({required this.slider});

  @override
  List<Object> get props => [slider];
}
