import 'package:flutter/material.dart';
import 'package:gool_goal_app/utils/app_colors.dart';
import 'package:gool_goal_app/utils/app_font_style.dart';

class ButtonWidget extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final Color? color;
  final VoidCallback? onPressed;
  final Widget? child;
  final String text;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [
      AppColor.primaryBlueLightShade,
      AppColor.primaryBlueDarkShade
    ]),
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(8.0);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        gradient: color == null ? gradient : null,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          minimumSize: Size.zero, // Set this
          padding: EdgeInsets.zero, // and this
        ),
        child: child ?? Text(text, style: AppFontStyle.buttonTextStyle()),
      ),
    );
  }
}
