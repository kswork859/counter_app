import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable {
  const ImagePickerEvents();
  @override
  List<Object> get props => [];
}

class PickImageGalleryEvent extends ImagePickerEvents {}

class CameraImageEvent extends ImagePickerEvents {}
