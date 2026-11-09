import 'package:counter_app/bloc/image_picker/image_picker_events.dart';
import 'package:counter_app/bloc/image_picker/image_picker_states.dart';
import 'package:counter_app/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<PickImageGalleryEvent>(_onPickImageGallery);
    on<CameraImageEvent>(_onCameraCapture);
  }
  void _onPickImageGallery(
    PickImageGalleryEvent event,
    Emitter<ImagePickerStates> emit,
  ) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }

  void _onCameraCapture(
    CameraImageEvent event,
    Emitter<ImagePickerStates> emit,
  ) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
