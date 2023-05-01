import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ParkingHistory extends StatefulWidget {
  const ParkingHistory({Key? key}) : super(key: key);

  @override
  State<ParkingHistory> createState() => _ParkingHistoryState();
}

class _ParkingHistoryState extends State<ParkingHistory> {
  @override
  Widget build(BuildContext context) {
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
            Text('GoolGoal',
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
      height: 180,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Parking Id:",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            12),
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
                            12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Booking Id:",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            12),
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
                            12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Date:",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            12),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "31 Oct,2023",
                        style: AppFontStyle.customTextStyle(
                            AppColor.primaryWhite,
                            AppFontStyle.fontFamilyPoppins,
                            FontType.semiBold,
                            12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hours:",
                            style: AppFontStyle.customTextStyle(
                                AppColor.primaryWhite,
                                AppFontStyle.fontFamilyPoppins,
                                FontType.semiBold,
                                12),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "6.5h",
                            style: AppFontStyle.customTextStyle(
                                AppColor.primaryWhite,
                                AppFontStyle.fontFamilyPoppins,
                                FontType.semiBold,
                                12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total:",
                            style: AppFontStyle.customTextStyle(
                                AppColor.primaryWhite,
                                AppFontStyle.fontFamilyPoppins,
                                FontType.semiBold,
                                12),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "1000rs.",
                            style: AppFontStyle.customTextStyle(
                                AppColor.primaryWhite,
                                AppFontStyle.fontFamilyPoppins,
                                FontType.semiBold,
                                12),
                          ),
                        ],
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
          const SizedBox(
            height: 10,
          ),
          Text(
            "Jhone Doe Parking",
            style: AppFontStyle.customTextStyle(AppColor.primaryWhite,
                AppFontStyle.fontFamilyPoppins, FontType.semiBold, 30),
          ),
        ],
      ),
    );
  }
}
