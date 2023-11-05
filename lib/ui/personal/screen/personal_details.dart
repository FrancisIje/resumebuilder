import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resumebuilder/constants/colors.dart';
import 'package:resumebuilder/constants/textstyle.dart';
import 'package:resumebuilder/crud/db_helper.dart';
import 'package:uuid/uuid.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

var uuid = const Uuid();

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  XFile? image;
  dynamic pickImageError;
  late Uint8List uint8List;

  final dbHelper = DatabaseHelper.instance;

  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  Future<void> _pickImageFromGallery() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Do something with the picked image
      setState(() {
        image = image;
      });

      uint8List = await image!.readAsBytes();
    }
  }

  Future<void> _saveToDb() async {
    try {
      await dbHelper.insert("Profiles", {
        'id': uuid.v4(),
        'name': nameController.text,
        'address': addressController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'image': uint8List,
      });
      // Optionally, show a success message or navigate to a different screen.
    } catch (e) {
      // Handle the error (e.g., show an error message).
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal",
          style: AppText.title,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _pickImageFromGallery();
                },
                child: CircleAvatar(
                  radius: 55.r,
                  backgroundColor: AppColors.secondary.withOpacity(0.7),
                  backgroundImage:
                      image == null ? null : FileImage(File(image!.path)),
                ),
              ),
              Positioned(
                  right: 125.w,
                  top: 80.h,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.black,
                  )),
            ],
          ),
          Text(
            "Name",
            style: AppText.bodyBlack,
          ),
          SizedBox(
            height: 50.h,
            child: TextFormField(
              controller: nameController,
              cursorColor: AppColors.secondary,
              decoration: InputDecoration(
                  labelText: "Enter Your Full Name",
                  labelStyle: AppText.greySubtitleSmall),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Address",
            style: AppText.bodyBlack,
          ),
          SizedBox(
            height: 150.h,
            child: TextFormField(
              controller: addressController,
              cursorColor: AppColors.secondary,
              maxLines: 5,
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Enter Your Address",
                  labelStyle: AppText.greySubtitleSmall),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "E-mail",
            style: AppText.bodyBlack,
          ),
          SizedBox(
            height: 50.h,
            child: TextFormField(
              controller: emailController,
              cursorColor: AppColors.secondary,
              decoration: InputDecoration(
                  labelText: "Enter Your Email",
                  labelStyle: AppText.greySubtitleSmall),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Phone",
            style: AppText.bodyBlack,
          ),
          SizedBox(
            height: 50.h,
            child: TextFormField(
              controller: phoneController,
              cursorColor: AppColors.secondary,
              decoration: InputDecoration(
                  labelText: "Enter Your Phone Number",
                  labelStyle: AppText.greySubtitleSmall),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
              onPressed: () {
                _saveToDb();
              },
              child: Text(
                "Save",
                style: AppText.subtitleBlack,
              )),
        ]),
      ),
    );
  }
}
