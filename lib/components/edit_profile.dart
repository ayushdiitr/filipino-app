import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:http/http.dart' as http;

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

  // Function to upload images to the API
  Future<void> _uploadImages() async {
    const String apiUrl =
        'http://10.0.2.2:8000/uploadPictures/3ab787ad-9a9a-4a52-a0c2-fd06fbd6745c/';
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

    for (int i = 0; i < images.length; i++) {
      if (images[i] != null) {
        var file = await http.MultipartFile.fromPath(
          // 'image$i', // Field name on your API endpoint
          'profile_picture', // Field name on your API endpoint
          images[i]!.path,
          filename: 'image$i.jpg', // Optional: specify filename
        );
        request.files.add(file);
      }
    }

    // Send the request
    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Images uploaded successfully');
        // Handle success, maybe show a success message
      } else {
        print('Failed to upload images. Status code: ${response.statusCode}');
        // Handle failure
      }
    } catch (e) {
      print('Error uploading images: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Progress bar container

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
                    height: 230,
                    width: 112,
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
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _uploadImages,
              child: const Text('Upload Images'),
            ),
          ],
        ),
      ],
    );
  }
}
