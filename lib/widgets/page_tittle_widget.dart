import 'package:flutter/material.dart';
import 'package:gool_goal_app/utils/utils.dart';

class PageTitleWidget extends StatelessWidget {
  final String title;
  final double? leftPadding;
  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;

  const PageTitleWidget(
      {Key? key,
      required this.title,
      this.leftPadding,
      this.topPadding,
      this.rightPadding,
      this.bottomPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding ?? 0, topPadding ?? 0,
          rightPadding ?? 0, bottomPadding ?? 0),
      child: Row(
        children: [
          Container(width: 2, height: 20, color: AppColor.primaryYellowColor),
          const SizedBox(width: 8),
          Text(title, style: AppFontStyle.tabLabelSelectedTextStyle()),
        ],
      ),
    );
  }
}
