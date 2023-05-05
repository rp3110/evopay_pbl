import 'package:flutter/material.dart';
import 'package:gool_goal_app/utils/app_colors.dart';
import 'package:gool_goal_app/utils/app_font_style.dart';
import 'package:gool_goal_app/utils/image_assets.dart';
import '../../pages/home/home_page.dart';
import '../../pages/user/profile_page.dart';
import '../parking_history/parking_history.dart';
import '../your_vechical_page/your_vehicle.dart';

class DashboardPage extends StatefulWidget {
  final int? pageIndex;

  const DashboardPage({Key? key, this.pageIndex}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  //this is a value notifier for the bottom navigation bar
  late ValueNotifier<int> currentScreen =
      ValueNotifier<int>(widget.pageIndex ?? 0);

  //this is a list of screens
  final List<Widget> currentScreens = [
    const HomePage(),
    const ParkingHistory(),
    const YourVehicle(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentScreen,
        builder: (context, flag, child) {
          return Scaffold(
              extendBody: true,
              appBar: null,
              body: currentScreens[currentScreen.value],
              bottomNavigationBar: Container(
                margin: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColor.primaryBlueLightShade,
                          AppColor.primaryBlueDarkShade,
                        ])),
                child: BottomNavigationBar(
                  currentIndex: currentScreen.value,
                  onTap: (int value) {
                    currentScreen.value = value;
                  },
                  elevation: 0,
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  selectedItemColor: AppColor.primaryWhite,
                  unselectedItemColor: AppColor.primaryTextFieldPlaceholder,
                  selectedLabelStyle: AppFontStyle.customTextStyle(
                      AppColor.primaryWhite,
                      AppFontStyle.fontFamilyRedHatDisplay,
                      FontType.regular,
                      12),
                  unselectedLabelStyle: AppFontStyle.customTextStyle(
                      AppColor.primaryTextFieldPlaceholder,
                      AppFontStyle.fontFamilyRedHatDisplay,
                      FontType.regular,
                      12),
                  selectedIconTheme:
                      const IconThemeData(color: AppColor.primaryWhite),
                  unselectedIconTheme: const IconThemeData(
                      color: AppColor.primaryTextFieldPlaceholder),
                  items: [
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        label: "",
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image.asset(ImagePath.icHomeTab,
                              width: 30,
                              height: 30,
                              color: currentScreen.value == 0
                                  ? AppColor.primaryWhite
                                  : AppColor.primaryTextFieldPlaceholder),
                        )),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        label: "",
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Icon(Icons.watch_later_outlined,
                              size: 30,
                              color: currentScreen.value == 1
                                  ? AppColor.primaryWhite
                                  : AppColor.primaryTextFieldPlaceholder),
                        )),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        label: "",
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Icon(Icons.list_alt,
                              size: 30,
                              color: currentScreen.value == 2
                                  ? AppColor.primaryWhite
                                  : AppColor.primaryTextFieldPlaceholder),
                        )),
                    BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        label: "",
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image.asset(ImagePath.icProfileTab,
                              width: 30,
                              height: 30,
                              color: currentScreen.value == 3
                                  ? AppColor.primaryWhite
                                  : AppColor.primaryTextFieldPlaceholder),
                        )),
                  ],
                ),
              ));
        });
  }
}
