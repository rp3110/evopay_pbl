import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class CircularImageWidget extends StatelessWidget {
  final String? empPhoto;
  final double? height;
  final double? width;

  const CircularImageWidget(
      {Key? key,
      required this.empPhoto,
      this.width = 100.0,
      this.height = 100.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: empPhoto ?? "",
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? 100.0,
        height: height ?? 100.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.primaryBlueDarkShade,
            width: 1.1,
          ),
        ),
        child: CircleAvatar(
            radius: (height! / 2),
            backgroundImage: const AssetImage(ImagePath.appLogo),
            backgroundColor: Colors.transparent),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.primaryBlueDarkShade,
            width: 1.1,
          ),
        ),
        child: CircleAvatar(
            radius: (height! / 2),
            backgroundImage: const AssetImage(ImagePath.appLogo),
            backgroundColor: Colors.transparent),
      ),
    );
  }
}
