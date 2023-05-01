import 'package:flutter/material.dart';
import 'package:gool_goal_app/models/team.dart';
import 'package:gool_goal_app/pages/teams/favourite_team_tile.dart';
import 'package:gool_goal_app/widgets/border_button_widget.dart';
import '../../utils/utils.dart';
import '../../widgets/button_widget.dart';
import '../dashboard/dashboard_page.dart';

class FavouriteTeamsPage extends StatelessWidget {
  FavouriteTeamsPage({Key? key}) : super(key: key);

  final List<Team> teamList = [
    Team(
        image: "",
        name: "Stoke City",
        leagueName: "Premier League",
        isFavourite: false,
        isSelected: false),
    Team(
        image: "",
        name: "Blackpool",
        leagueName: "Europa League",
        isFavourite: false,
        isSelected: false),
    Team(
        image: "",
        name: "Rochdale",
        leagueName: "Pernambucano U20",
        isFavourite: false,
        isSelected: false),
    Team(
        image: "",
        name: "Everton",
        leagueName: "Matogrossense",
        isFavourite: false,
        isSelected: false),
    Team(
        image: "",
        name: "Crystal Palace",
        leagueName: "3.Bundesliga",
        isFavourite: false,
        isSelected: false),
    Team(
        image: "",
        name: "Watford",
        leagueName: "Championship",
        isFavourite: false,
        isSelected: false),
    Team(
        image: "",
        name: "Rotherham United",
        leagueName: "Premier Liga",
        isFavourite: false,
        isSelected: false),
    Team(
        image: "",
        name: "Test team 1",
        leagueName: "Test League 1",
        isFavourite: false,
        isSelected: false),
    Team(
        image: "",
        name: "Test team 2",
        leagueName: "Test League 2",
        isFavourite: false,
        isSelected: false),
    Team(
        image: "",
        name: "Test team 3",
        leagueName: "Test League 3",
        isFavourite: false,
        isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonFunction.buildCustomAppBarWidget("Favourite Teams"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Favorite the TEAMS you want to keep up with for match updates.",
              maxLines: 2,
              style: AppFontStyle.customTextStyle(AppColor.primaryBlack,
                  AppFontStyle.fontFamilyRedHatDisplay, FontType.regular, 14.0),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          _buildTeamListWidget(),
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
                      MaterialPageRoute(builder: (context) => const DashboardPage()),
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
                    final favouriteTeams =
                        teamList.where((team) => team.isFavourite).toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardPage()),
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

  Widget _buildTeamListWidget() {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
                color: AppColor.primaryTextFieldPlaceholder,
              ),
          itemCount: teamList.length,
          itemBuilder: (context, index) {
            return FavoriteTeamTile(
              team: teamList[index],
            );
          }),
    );
  }
}
