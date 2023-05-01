import 'package:flutter/material.dart';
import 'package:gool_goal_app/utils/app_colors.dart';
import 'package:gool_goal_app/utils/app_font_style.dart';

class BorderButtonWidget extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final Color borderColor;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Widget? child;
  final String text;
  final Color textColor;
  final double textFontSize;

  const BorderButtonWidget(
      {Key? key,
      required this.onPressed,
      this.child,
      this.borderRadius,
      this.borderColor = AppColor.primaryBlack,
      this.width,
      this.height = 44.0,
      required this.text,
      this.textColor = AppColor.primaryBlack,
      this.textFontSize = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(5.0);
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: borderRadius,
          border: Border.all(color: borderColor, width: 1.5)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
        ),
        child: child ??
            Text(
              text,
              style: AppFontStyle.customTextStyle(
                  textColor,
                  AppFontStyle.fontFamilyRedHatDisplay,
                  FontType.medium,
                  textFontSize),
            ),
      ),
    );
  }
}
