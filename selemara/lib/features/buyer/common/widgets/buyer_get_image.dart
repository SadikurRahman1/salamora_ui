import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_colors.dart';


class GetImageFromGalleryCamera {
  chooseImage(BuildContext context, void Function(XFile image)? onTap) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 160,
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      _openCamera(context, onTap);
                    },
                    child: Column(
                      children: const [
                        Icon(Icons.camera_enhance_outlined, size: 30, color: Colors.indigo),
                        SizedBox(height: 5),
                        Text(
                          "From Camera",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _openGallery(context, onTap);
                    },
                    child: Column(
                      children: const [
                        Icon(Icons.photo_album, size: 30, color: Colors.indigo),
                        SizedBox(height: 5),
                        Text(
                          "From Gallery",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _openGallery( context, void Function(XFile image)? onTap) async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture != null) {
      onTap?.call(picture);
    }
    Navigator.of(context).pop();
  }

  void _openCamera( context, void Function(XFile image)? onTap) async {
    final picture = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picture != null) {
      onTap?.call(picture);
    }
    Navigator.of(context).pop();
  }
}

