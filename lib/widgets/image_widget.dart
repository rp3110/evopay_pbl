import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class ImageWidget extends StatelessWidget {
  final String? empPhoto;
  final double? height;
  final double? width;
  const ImageWidget(
      {Key? key,
      required this.empPhoto,
      this.width = 100.0,
      this.height = 100.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "http://www.test.com",
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? 100.0,
        height: height ?? 100.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      placeholder: (context, url) => CircleAvatar(
          radius: (height! / 2),
          backgroundImage: const AssetImage(ImagePath.appLogo),
          backgroundColor: Colors.transparent),
      errorWidget: (context, url, error) => CircleAvatar(
          radius: (height! / 2),
          backgroundImage: const AssetImage(ImagePath.appLogo),
          backgroundColor: Colors.transparent),
    );
  }
}
