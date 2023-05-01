import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CommonFloatingActionButton extends StatelessWidget {
  final Function() onPressed;
  const CommonFloatingActionButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPressed();
      },
      backgroundColor: AppColor.primaryYellowColor,
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
