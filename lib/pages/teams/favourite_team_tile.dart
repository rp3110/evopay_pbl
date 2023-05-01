import 'package:flutter/material.dart';
import '../../models/team.dart';
import '../../widgets/circular_image_widget.dart';
import '../../utils/utils.dart';

class FavoriteTeamTile extends StatelessWidget {
  final Team team;

  const FavoriteTeamTile({required this.team, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isFavourite = ValueNotifier<bool>(team.isFavourite);

    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        dense: true,
        leading: CircularImageWidget(
          empPhoto: team.image,
          height: 40.0,
          width: 40.0,
        ),
        title: Text(
          team.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppFontStyle.customTextStyle(AppColor.primaryBlack,
              AppFontStyle.fontFamilyRedHatDisplay, FontType.semiBold, 14.0),
        ),
        subtitle: Text(
          team.leagueName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppFontStyle.customTextStyle(AppColor.secondaryGray,
              AppFontStyle.fontFamilyRedHatDisplay, FontType.regular, 13.0),
        ),
        trailing: ValueListenableBuilder(
            valueListenable: isFavourite,
            builder: (context, flag, widget) {
              return IconButton(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  constraints: const BoxConstraints(),
                  iconSize: 20.0,
                  icon: isFavourite.value
                      ? Image.asset(ImagePath.icFavouriteSelected)
                      : Image.asset(ImagePath.icFavouriteUnselected),
                  onPressed: () {
                    isFavourite.value = !isFavourite.value;
                    team.isFavourite = isFavourite.value;
                  });
            }),
      ),
    );
  }
}
