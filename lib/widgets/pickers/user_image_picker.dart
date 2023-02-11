import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final Function(File pickedImage) imagePickFn;
  const UserImagePicker(this.imagePickFn);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  var _pickedImg = File('');

  void _pickImage() async {
    final _pickedImage = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
    final _pickedImageFile = File(_pickedImage!.path);
    setState(() {
      _pickedImg = _pickedImageFile;
    });
    widget.imagePickFn(_pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: FileImage(_pickedImg),
          backgroundColor: Colors.grey,
        ),
        TextButton.icon(
            onPressed: _pickImage,
            icon: Icon(Icons.image),
            label: Text('Add Image')),
      ],
    );
  }
}
