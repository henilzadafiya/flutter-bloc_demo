import 'package:bloc/bloc.dart';
import 'package:flutter_block_demo_practice/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import 'image_picker_event.dart';
import 'image_picker_state.dart';



class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()){
   on<CameraCapture>(cameraCapture);
  }
  void cameraCapture(CameraCapture event , Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
