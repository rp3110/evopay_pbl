import 'package:flutter/material.dart';
import 'package:gool_goal_app/utils/utils.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'circular_image_widget.dart';

class ProfileImageView extends StatefulWidget {
  final bool isEdit;
  final String imagePath;
  final VoidCallback onClicked;
  final Function(File?) onImageSelect;
  final String? profileImageData;

  const ProfileImageView(
      {Key? key,
      required this.imagePath,
      this.isEdit = false,
      required this.onClicked,
      required this.onImageSelect,
      required this.profileImageData})
      : super(key: key);

  @override
  State<ProfileImageView> createState() => _ProfileImageViewState();
}

class _ProfileImageViewState extends State<ProfileImageView> {
  File? _imageFile;
  final _picker = ImagePicker();

  //XFile? _imageFile;
  //final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          (widget.imagePath == "" || _imageFile != null)
              ? _buildImage()
              : _buildURLRenderImage(),
          Positioned(
              bottom: 0,
              right: 4,
              child: InkWell(
                  onTap: () {
                    if (widget.isEdit) {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => _bottomSheet()),
                      );
                    }
                  },
                  child: _buildEditIcon(AppColor.primaryBlueColor))),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.primaryBlueDarkShade,
              width: 1.1,
            ),
          ),
          child: Ink.image(
            image: _imageFile == null
                ? const AssetImage(ImagePath.userProfilePic) as ImageProvider
                : FileImage(File(_imageFile!.path)),
            fit: BoxFit.cover,
            width: 105.0,
            height: 105.0,
            child: InkWell(onTap: () {
              if (widget.isEdit) {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => _bottomSheet()),
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildURLRenderImage() {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          if (widget.isEdit) {
            showModalBottomSheet(
              context: context,
              builder: ((builder) => _bottomSheet()),
            );
          }
        },
        child: Container(
          width: 105.0,
          height: 105.0,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.primaryBlueDarkShade,
              width: 1.1,
            ),
          ),
          child: CircularImageWidget(
              empPhoto: widget.imagePath, width: 100, height: 100),
        ));
  }

  Widget _buildEditIcon(Color color) => _buildCircle(
      color: Colors.white,
      all: 1,
      child: _buildCircle(
        all: 4,
        color: color,
        child: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
          size: 20,
        ),
      ));

  Widget _buildCircle(
          {required Widget child, required double all, required Color color}) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  Widget _bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColor.primaryBlueColor),
              ),
              icon: const Icon(Icons.camera),
              onPressed: () {
                openImagePicker(ImageSource.camera);
              },
              label: const Text("Camera"),
            ),
            const SizedBox(
              width: 24,
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColor.primaryBlueColor),
              ),
              icon: const Icon(Icons.image),
              onPressed: () {
                openImagePicker(ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void openImagePicker(ImageSource source) async {
    /*final pickedFile = await _picker.pickImage(
      source: source,
    );
    if (context.mounted) Navigator.of(context).pop();
    setState(() {
      _imageFile = pickedFile;
    });*/

    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (context.mounted) Navigator.of(context).pop();
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
        //print("_imageFile.path = ${_imageFile?.path}");
      });
      widget.onImageSelect(_imageFile);
    }
  }
}
