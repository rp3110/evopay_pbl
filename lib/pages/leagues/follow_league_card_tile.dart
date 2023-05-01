import 'package:flutter/material.dart';
import 'package:gool_goal_app/widgets/image_widget.dart';
import '../../models/league.dart';
import '../../utils/utils.dart';
import '../../widgets/border_button_widget.dart';
import '../../widgets/button_widget.dart';

class FollowLeagueCardTile extends StatelessWidget {
  final League league;

  ///[isFollowing] is a value notifier
  //ValueNotifier<bool> isFollowing = ValueNotifier<bool>(false);
  final Function(bool) onFollowStatusChange;

  const FollowLeagueCardTile(
      {required this.league,
      //required this.isFollowing,
      required this.onFollowStatusChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              color: AppColor.primaryYellowColor,
              child: Center(
                child:
                    ImageWidget(empPhoto: league.image, height: 44, width: 44),
              ),
            ),
            Expanded(
              child: Container(
                height: 60.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColor.primaryBlueLightShade,
                    AppColor.primaryBlueDarkShade
                  ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        league.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppFontStyle.customTextStyle(
                            AppColor.secondaryWhite,
                            AppFontStyle.fontFamilyRedHatDisplay,
                            FontType.semiBold,
                            15.0),
                      ),
                      !league.isFollowing
                          ? BorderButtonWidget(
                              text: "Follow",
                              textColor: AppColor.primaryYellowColor,
                              borderColor: AppColor.primaryYellowColor,
                              width: 62,
                              height: 26,
                              onPressed: () {
                                league.isFollowing = !league.isFollowing;
                                onFollowStatusChange(league.isFollowing);
                              })
                          : ButtonWidget(
                              text: "Following",
                              width: 76,
                              height: 26,
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: const LinearGradient(colors: [
                                AppColor.primaryYellowColor,
                                AppColor.primaryYellowColor
                              ]),
                              child: Text("Following",
                                  style: AppFontStyle.customTextStyle(
                                      AppColor.primaryBlack,
                                      AppFontStyle.fontFamilyRedHatDisplay,
                                      FontType.medium,
                                      12.0)),
                              onPressed: () {
                                league.isFollowing = !league.isFollowing;
                                onFollowStatusChange(league.isFollowing);
                              }),
                      /*ValueListenableBuilder(
                          valueListenable: isFollowing,
                          builder: (context, flag, widget) {
                            return !isFollowing.value ?
                            BorderButtonWidget(text: "Follow",
                                textColor: AppColor.primaryYellowColor,
                                borderColor: AppColor.primaryYellowColor,
                                width: 62, height: 26, onPressed: () {
                              isFollowing.value = !isFollowing.value;
                              onFollowStatusChange(isFollowing.value);
                            }) :
                            ButtonWidget(text: "Following", width: 76, height: 26, borderRadius: BorderRadius.circular(5.0),
                                gradient: const LinearGradient(colors: [AppColor.primaryYellowColor, AppColor.primaryYellowColor]),
                                child: Text("Following",
                                    style: AppFontStyle.customTextStyle(
                                        AppColor.primaryBlack, AppFontStyle.fontFamilyRedHatDisplay,
                                        FontType.medium, 12.0)
                                ),
                                onPressed: () {
                                  isFollowing.value = !isFollowing.value;
                                });
                          }),*/
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
