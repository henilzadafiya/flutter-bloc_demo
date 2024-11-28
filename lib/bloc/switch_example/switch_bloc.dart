
import 'package:bloc/bloc.dart';
import 'package:flutter_block_demo_practice/bloc/switch_example/switch_event.dart';
import 'package:flutter_block_demo_practice/bloc/switch_example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc():super(SwitchState()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SwitchSlider>(_switchSlider);
  }
  void _enableOrDisableNotification(EnableOrDisableNotification event,Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
  void _switchSlider(SwitchSlider event ,Emitter<SwitchState> emit){
    emit(state.copyWith(slider: event.slider));
  }
}