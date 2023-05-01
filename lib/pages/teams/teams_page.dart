import 'package:flutter/material.dart';
import 'package:gool_goal_app/utils/utils.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColor.primaryBlueLightShade,
              AppColor.primaryBlueDarkShade
            ]),
          ),
        ),
      ),
      body: const SizedBox(),
    );
  }
}
