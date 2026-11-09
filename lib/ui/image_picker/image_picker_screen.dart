import 'dart:io';

import 'package:counter_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:counter_app/bloc/image_picker/image_picker_events.dart';
import 'package:counter_app/bloc/image_picker/image_picker_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});
  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreen();
}

class _ImagePickerScreen extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerStates>(
              builder: (context, state) {
                return state.file == null
                    ? Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: Colors.black),
                        ),
                        child: Center(child: Text("No Image Selected")),
                      )
                    : Image.file(
                        File(state.file!.path.toString()),
                        width: 200,
                        height: 200,
                      );
              },
            ),

            SizedBox(height: 30),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                  builder: (context, states) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<ImagePickerBloc>().add(
                          PickImageGalleryEvent(),
                        );
                      },
                      child: Text("Open Gallery"),
                    );
                  },
                ),

                BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                  builder: (context, states) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<ImagePickerBloc>().add(CameraImageEvent());
                      },
                      child: Text("Camera Capture"),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
