import 'package:flutter/material.dart';
import 'package:gool_goal_app/pages/home/widget_image_slider.dart';
import 'package:gool_goal_app/pages/vehicle_details_page/vehical_details_page.dart';
import 'package:gool_goal_app/utils/app_colors.dart';
import 'package:gool_goal_app/utils/app_font_style.dart';
import 'package:gool_goal_app/utils/image_assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cardWidget() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const VehicleDetailsPage();
            },
          ));
        },
        child: Container(
          height: 100,
          width: double.maxFinite,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: AppColor.primaryBlueColor,
              borderRadius: BorderRadius.circular(9)),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    color: Colors.white,
                    height: 95,
                    width: 95,
                    child: Image.asset(
                      ImagePath.appLogo,
                      height: 95,
                      width: 95,
                    ),
                  )),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jhone Doe Parking",
                    style: AppFontStyle.customTextStyle(AppColor.primaryWhite,
                        AppFontStyle.fontFamilyPoppins, FontType.semiBold, 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "Id:",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            16),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "917483292281910",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Ahemdabad",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            12),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagePath.dashboardAppLogo,
                width: 50, height: 32, fit: BoxFit.scaleDown),
            const SizedBox(width: 4),
            Text('Home',
                style: AppFontStyle.customTextStyle(AppColor.primaryWhite,
                    AppFontStyle.fontFamilyRedHatDisplay, FontType.bold, 18.0)),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const WidgetImageSlider(),
          ListView.separated(
            itemCount: 8,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return cardWidget();
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
