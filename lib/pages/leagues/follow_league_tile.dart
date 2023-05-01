import 'package:flutter/material.dart';
import 'package:gool_goal_app/widgets/circular_image_widget.dart';
import '../../models/league.dart';
import '../../utils/utils.dart';
import '../../widgets/border_button_widget.dart';
import '../../widgets/button_widget.dart';

class FollowLeagueTile extends StatelessWidget {
  final League league;

  const FollowLeagueTile({required this.league, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isFollowing = ValueNotifier<bool>(league.isFollowing);

    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        dense: true,
        leading: CircularImageWidget(
          empPhoto: league.image,
          height: 40.0,
          width: 40.0,
        ),
        title: Text(
          league.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppFontStyle.customTextStyle(AppColor.primaryBlack,
              AppFontStyle.fontFamilyRedHatDisplay, FontType.semiBold, 14.0),
        ),
        subtitle: null,
        trailing: ValueListenableBuilder(
            valueListenable: isFollowing,
            builder: (context, flag, widget) {
              return !isFollowing.value
                  ? BorderButtonWidget(
                      text: "Follow",
                      width: 64,
                      height: 28,
                      onPressed: () {
                        isFollowing.value = !isFollowing.value;
                        league.isFollowing = isFollowing.value;
                      })
                  : ButtonWidget(
                      text: "Following",
                      width: 78,
                      height: 28,
                      borderRadius: BorderRadius.circular(5.0),
                      child: Text("Following",
                          style: AppFontStyle.customTextStyle(
                              AppColor.primaryWhite,
                              AppFontStyle.fontFamilyRedHatDisplay,
                              FontType.medium,
                              12.0)),
                      onPressed: () {
                        isFollowing.value = !isFollowing.value;
                        league.isFollowing = isFollowing.value;
                      });
            }),
      ),
    );
  }
}
