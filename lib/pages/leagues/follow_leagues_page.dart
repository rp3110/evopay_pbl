import 'package:flutter/material.dart';
import 'package:gool_goal_app/models/league.dart';
import 'package:gool_goal_app/widgets/border_button_widget.dart';
import '../../utils/utils.dart';
import '../../widgets/button_widget.dart';
import 'follow_league_tile.dart';
import '../../pages/teams/favourite_teams_page.dart';

class FollowLeaguesPage extends StatelessWidget {
  FollowLeaguesPage({Key? key}) : super(key: key);

  final List<League> leagueList = [
    League(
        image: "",
        name: "Premier League",
        isFollowing: false,
        isSelected: false),
    League(
        image: "",
        name: "Fifa World Cup",
        isFollowing: false,
        isSelected: false),
    League(
        image: "",
        name: "English Football League",
        isFollowing: false,
        isSelected: false),
    League(
        image: "",
        name: "UEFA Nations League",
        isFollowing: false,
        isSelected: false),
    League(image: "", name: "League One", isFollowing: false, isSelected: false),
    League(image: "", name: "Laliga", isFollowing: false, isSelected: false),
    League(image: "", name: "Series A", isFollowing: false, isSelected: false),
    League(
        image: "",
        name: "Test League 1",
        isFollowing: false,
        isSelected: false),
    League(
        image: "",
        name: "Test League 2",
        isFollowing: false,
        isSelected: false),
    League(
        image: "",
        name: "Test League 3",
        isFollowing: false,
        isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.buildCustomAppBarWidget("Follow Leagues",
          automaticallyImplyLeading: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Follow the LEAGUES you want to keep up with for match updates.",
              maxLines: 2,
              style: AppFontStyle.customTextStyle(AppColor.primaryBlack,
                  AppFontStyle.fontFamilyRedHatDisplay, FontType.regular, 14.0),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          _buildLeagueListWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BorderButtonWidget(
                  text: "Skip >",
                  width: 74,
                  height: 28,
                  textFontSize: 15,
                  textColor: AppColor.primaryBlueColor,
                  borderColor: AppColor.primaryBlueColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteTeamsPage()),
                    );
                  },
                ),
                ButtonWidget(
                  text: "Continue",
                  width: 95,
                  height: 28,
                  borderRadius: BorderRadius.circular(5.0),
                  child: Text("Continue",
                      style: AppFontStyle.customTextStyle(
                          AppColor.primaryWhite,
                          AppFontStyle.fontFamilyRedHatDisplay,
                          FontType.medium,
                          15.0)),
                  onPressed: () {
                    final followingLeagues =
                        leagueList.where((league) => league.isFollowing);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouriteTeamsPage()),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLeagueListWidget() {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
                color: AppColor.primaryTextFieldPlaceholder,
              ),
          itemCount: leagueList.length,
          itemBuilder: (context, index) {
            return FollowLeagueTile(
              league: leagueList[index],
            );
          }),
    );
  }
}
