import 'package:flutter/material.dart';
import 'package:gool_goal_app/widgets/image_widget.dart';
import '../../models/team.dart';
import '../../utils/utils.dart';

class FavouriteTeamCardTile extends StatelessWidget {
  final Team team;
  //ValueNotifier<bool> isFavourite = ValueNotifier<bool>(false);
  final Function(bool) onFavouriteStatusChange;

  const FavouriteTeamCardTile(
      {required this.team,
      //required this.isFavourite,
      required this.onFavouriteStatusChange,
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
                child: ImageWidget(empPhoto: team.image, height: 44, width: 44),
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
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            team.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppFontStyle.customTextStyle(
                                AppColor.secondaryWhite,
                                AppFontStyle.fontFamilyRedHatDisplay,
                                FontType.semiBold,
                                15.0),
                          ),
                          Text(
                            team.leagueName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppFontStyle.customTextStyle(
                                AppColor.primaryTextFieldPlaceholder,
                                AppFontStyle.fontFamilyPoppins,
                                FontType.regular,
                                13.0),
                          )
                        ],
                      ),
                      IconButton(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          constraints: const BoxConstraints(),
                          iconSize: 20.0,
                          icon: team.isFavourite
                              ? Image.asset(ImagePath.icFavouriteSelected,
                                  color: AppColor.primaryYellowColor)
                              : Image.asset(ImagePath.icFavouriteUnselected,
                                  color: AppColor.primaryYellowColor),
                          onPressed: () {
                            team.isFavourite = !team.isFavourite;
                            onFavouriteStatusChange(team.isFavourite);
                          }),
                      /*ValueListenableBuilder(
                          valueListenable: isFavourite,
                          builder: (context, flag, widget) {
                            return IconButton(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                constraints: const BoxConstraints(),
                                iconSize: 20.0,
                                icon: isFavourite.value ? Image.asset(ImagePath.icFavouriteSelected, color: AppColor.primaryYellowColor)
                                    : Image.asset(ImagePath.icFavouriteUnselected, color: AppColor.primaryYellowColor),
                                onPressed: () {
                                  isFavourite.value = !isFavourite.value;
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
