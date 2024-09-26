import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _picker = ImagePicker();
  List<File?> images = List<File?>.filled(6, null); // List to hold images

  // Function to pick and crop an image
  Future<void> _pickImage(int index) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          hideBottomControls: false,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        iosUiSettings: const IOSUiSettings(
          title: 'Crop Image',
        ),
      );

      if (croppedFile != null) {
        setState(() {
          images[index] = croppedFile;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row for 'Preview' button and 'Edit Profile' text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Edit Profile',
              style: TextStyle(
                fontFamily: 'Baskerville',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                height: 25.91 / 30,
                letterSpacing: 2,
                color: Color(0xFF000000),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add your navigation or animation logic here
                // print("Preview button clicked");
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Preview',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                    color: Colors.white,
                    height: 16.8 / 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Complete your profile for better chance of matching',
          style: TextStyle(
            fontFamily: 'NoirPro',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            height: 16.8 / 14,
            letterSpacing: 2,
            color: Color(0xFF1F1F1F),
          ),
        ),
        const SizedBox(height: 12),
        // Progress bar container

        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300, // Specify the width you need
                child: LinearProgressIndicator(
                  value: 0.2,
                  color: Colors.black,
                  backgroundColor: Color(0xFFEEEEEE),
                ),
              ),
              Text(
                '85% Complete',
                style: TextStyle(
                  fontFamily: 'NoirPro',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.02,
                  color: Color(0xFF1F1F1F),
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: double.infinity,
          height: 30,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(
              color: const Color(0xFFEEEEEE),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
        const SizedBox(height: 20),

        // Grid for displaying images
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: 250, // Fixed height for the grid
            child: GridView.builder(
              itemCount: 6, // Total 6 tiles
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _pickImage(index); // Call the cropper here
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: images[index] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.file(
                              images[index]!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Center(
                            child: Icon(
                              Icons.add,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
