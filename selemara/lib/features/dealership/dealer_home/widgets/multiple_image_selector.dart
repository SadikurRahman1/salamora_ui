import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_colors.dart';

class GetImageFromGalleryMultiple {
  chooseImage(
      BuildContext context, {
        void Function(XFile image)? onSingleTap,
        void Function(List<XFile> images)? onMultipleTap,
      }) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Choose Option",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => _openCamera(context, onSingleTap),
                    child: Column(
                      children: const [
                        Icon(Icons.camera_enhance_outlined,
                            size: 30, color: Colors.indigo),
                        SizedBox(height: 5),
                        Text("From Camera",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: () => _openGallery(context, onSingleTap),
                  //   child: Column(
                  //     children: const [
                  //       Icon(Icons.photo_album,
                  //           size: 30, color: Colors.indigo),
                  //       SizedBox(height: 5),
                  //       Text("Single From Gallery",
                  //           style: TextStyle(
                  //               fontSize: 16, fontWeight: FontWeight.bold)),
                  //     ],
                  //   ),
                  // ),
                  InkWell(
                    onTap: () => _openGalleryMultiple(context, onMultipleTap),
                    child: Column(
                      children: const [
                        Icon(Icons.collections,
                            size: 30, color: Colors.indigo),
                        SizedBox(height: 5),
                        Text("Multiple From Gallery",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // void _openGallery(
  //     BuildContext context, void Function(XFile image)? onTap) async {
  //   final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (picture != null) {
  //     onTap?.call(picture);
  //   }
  //   Navigator.of(context).pop();
  // }

  void _openGalleryMultiple(
      BuildContext context, void Function(List<XFile> images)? onTap) async {
    final pictures = await ImagePicker().pickMultiImage();
    if (pictures != null && pictures.isNotEmpty) {
      onTap?.call(pictures);
    }
    Navigator.of(context).pop();
  }

  void _openCamera(
      BuildContext context, void Function(XFile image)? onTap) async {
    final picture = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picture != null) {
      onTap?.call(picture);
    }
    Navigator.of(context).pop();
  }
}
