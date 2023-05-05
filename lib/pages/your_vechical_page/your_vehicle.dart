import 'package:flutter/material.dart';
import 'package:gool_goal_app/utils/utils.dart';

class YourVehicle extends StatefulWidget {
  const YourVehicle({Key? key}) : super(key: key);

  @override
  State<YourVehicle> createState() => _YourVehicleState();
}

class _YourVehicleState extends State<YourVehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagePath.dashboardAppLogo,
                width: 50, height: 32, fit: BoxFit.scaleDown),
            const SizedBox(width: 4),
            Text('Your Vehicle',
                style: AppFontStyle.customTextStyle(AppColor.primaryWhite,
                    AppFontStyle.fontFamilyRedHatDisplay, FontType.bold, 18.0)),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        itemCount: 8,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return cardWidget();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }

  cardWidget() {
    return Container(
      height: 100,
      width: double.maxFinite,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColor.primaryBlueColor,
          borderRadius: BorderRadius.circular(9)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    color: Colors.white,
                    height: 75,
                    width: 125,
                    child: Image.asset(
                      ImagePath.appLogo,
                      height: 75,
                      width: 125,
                    ),
                  )),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Vehicle Name :",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            14),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "XC 90",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Plate No :",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            14),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "GJCJ9900",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Id :",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            14),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "001220220338",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            14),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
