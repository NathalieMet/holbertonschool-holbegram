import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  const AddPicture({
    super.key,
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  Uint8List? _image;

  Future<void> selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

      if (pickedImage != null) {
    final imageBytes = await pickedImage.readAsBytes();
    setState(() {
      _image = imageBytes;
    });
  }
}

  Future<void> selectImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.camera,
    );

      if (pickedImage != null) {
    final imageBytes = await pickedImage.readAsBytes();
    setState(() {
      _image = imageBytes;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const SizedBox(height: 28),
            const Text(
              'Holbegram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 50,
              ),
            ),
            const Image(
              image: AssetImage('assets/images/logo.webp'),
              width: 80,
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 40.0), // Espace à gauche et à droite
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligne les textes à gauche
                children: [
                  Text(
                    'Hello, ${widget.username} Welcome to Holbegram.',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Choose an image from your gallery or take a new one.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
                _image != null
                  ? Image.memory(
                      _image!,
                      width: 220,
                      height: 180,
                      fit: BoxFit.cover, // Ajuste l'image à l'espace
                    )
                  : const Image(
      image: AssetImage('assets/images/Sample_User_Icon.png'),
      width: 220,
      height: 180,
    ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.image,
                    size: 40,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    selectImageFromGallery();
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.photo_camera,
                    size: 40,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    selectImageFromCamera();
                  },
                ),
              ],
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(218, 226, 37, 24),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  color: Color.fromARGB(218, 255, 255, 255),
                  fontSize: 25,
                ),
              ),
              onPressed: () {},
            ),
          ])),
    );
  }
}




