import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class screenimagepick extends StatefulWidget {
  screenimagepick({super.key});

  @override
  State<screenimagepick> createState() => _screenimagepickState();
}

class _screenimagepickState extends State<screenimagepick> {
  Uint8List? _image;

  imagePick(ImageSource source) async {
    final ImagePicker _imagepicker = ImagePicker();
    XFile? _file = await _imagepicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("No iMagevselected");
  }

  void selectimage() async {
    Uint8List img = await imagePick(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: MemoryImage(_image!),
                  )
                : CircleAvatar(),
            ElevatedButton(
                onPressed: () {
                  selectimage();
                },
                child: Text("imagepicker"))
          ],
        ),
      ),
    );
  }
}
