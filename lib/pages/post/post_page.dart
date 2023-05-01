import 'package:flutter/material.dart';
import 'package:gool_goal_app/utils/app_colors.dart';

import '../../utils/app_font_style.dart';
import '../../utils/common_function.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.buildCustomAppBarWidget("Post",
          automaticallyImplyLeading: false),
      body: Center(
        child: Text('Coming Soon...\n(Phase II)',
            textAlign: TextAlign.center,
            style: AppFontStyle.customTextStyle(AppColor.primaryBlueColor,
                AppFontStyle.fontFamilyRedHatDisplay, FontType.semiBold, 18.0)),
      ),
    );
  }
}
