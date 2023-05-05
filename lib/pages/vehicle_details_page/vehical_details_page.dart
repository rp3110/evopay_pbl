import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/page_tittle_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../home/widget_image_slider.dart';

class VehicleDetailsPage extends StatelessWidget {
  const VehicleDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Parking Details',
                style: AppFontStyle.customTextStyle(AppColor.primaryWhite,
                    AppFontStyle.fontFamilyRedHatDisplay, FontType.bold, 18.0)),
          ],
        ),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          const WidgetImageSlider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageTitleWidget(title: "About Parking"),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Jhon Doe Parking",
                  style: AppFontStyle.customTextStyle(AppColor.primaryBlueColor,
                      AppFontStyle.fontFamilyPoppins, FontType.regular, 16),
                ),
                Text(
                  AppMessages.parkingDetails,
                  textAlign: TextAlign.justify,
                  style: AppFontStyle.customTextStyle(AppColor.defaultBlack,
                      AppFontStyle.fontFamilyPoppins, FontType.regular, 12),
                ),
                const SizedBox(
                  height: 25,
                ),
                const PageTitleWidget(title: "Timing"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Day",
                      textAlign: TextAlign.justify,
                      style: AppFontStyle.customTextStyle(AppColor.defaultBlack,
                          AppFontStyle.fontFamilyPoppins, FontType.bold, 12),
                    ),
                    Text(
                      "Status",
                      textAlign: TextAlign.justify,
                      style: AppFontStyle.customTextStyle(AppColor.defaultBlack,
                          AppFontStyle.fontFamilyPoppins, FontType.bold, 12),
                    ),
                    Text(
                      "Timing",
                      textAlign: TextAlign.justify,
                      style: AppFontStyle.customTextStyle(AppColor.defaultBlack,
                          AppFontStyle.fontFamilyPoppins, FontType.bold, 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                widgetTiming("Monday", "Open", "8:00AM - 10:00PM"),
                widgetTiming("Tuesday", "Open", "8:00AM - 10:00PM"),
                widgetTiming("Wednesday", "Open", "8:00AM - 10:00PM"),
                widgetTiming("Thursday", "Open", "8:00AM - 10:00PM"),
                widgetTiming("Friday", "Open", "8:00AM - 10:00PM"),
                widgetTiming("Saturday", "Open", "8:00AM - 10:00PM"),
                widgetTiming("Sunday", "Close", "8:00AM - 10:00PM"),
                const SizedBox(
                  height: 25,
                ),
                const PageTitleWidget(title: "Availability"),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    widgetSlots("Total \nSlots", "100"),
                    const SizedBox(
                      width: 8,
                    ),
                    widgetSlots("Occupied Slots", "25"),
                    const SizedBox(
                      width: 8,
                    ),
                    widgetSlots("Available Slots", "75"),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const PageTitleWidget(title: "Rates"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "120rs / hour",
                  textAlign: TextAlign.justify,
                  style: AppFontStyle.customTextStyle(AppColor.primaryBlueColor,
                      AppFontStyle.fontFamilyPoppins, FontType.regular, 16),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonWidget(
            text: "Book Parking",
            onPressed: () async {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0))),
                builder: (context) {
                  return Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: AppColor.primaryBlueDarkShade,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12))),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Book Parking",
                          textAlign: TextAlign.justify,
                          style: AppFontStyle.customTextStyle(
                              AppColor.primaryWhite,
                              AppFontStyle.fontFamilyPoppins,
                              FontType.bold,
                              25),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                            name: "",
                            hasPrefix: false,
                            validations: [],
                            flag: true,
                            controller: TextEditingController(),
                            autoFocus: false,
                            keyboardType: TextInputType.emailAddress,
                            placeholder: "Enter Hours",
                            isReadOnly: false,
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                            onSubmitField: () {
                              /*_fieldFocusChange(context, _txtEmailFocus, _txtPasswordFocus);*/
                            },
                            errorMessages: const [
                              "Please enter your email address",
                              "Invalid email address"
                            ]),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 44,
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white),
                          child: Text(
                            "Book Parking",
                            style: AppFontStyle.customTextStyle(
                                AppColor.primaryBlueDarkShade,
                                AppFontStyle.fontFamilyPoppins,
                                FontType.bold,
                                12),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

  widgetSlots(String title, String total) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          color: AppColor.primaryBlueColor,
          borderRadius: BorderRadius.circular(7)),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              title,
              textAlign: TextAlign.justify,
              style: AppFontStyle.customTextStyle(AppColor.primaryWhite,
                  AppFontStyle.fontFamilyPoppins, FontType.medium, 12),
            ),
          ),
          Text(
            total,
            textAlign: TextAlign.justify,
            style: AppFontStyle.customTextStyle(AppColor.primaryWhite,
                AppFontStyle.fontFamilyPoppins, FontType.bold, 25),
          ),
        ],
      ),
    );
  }

  widgetTiming(String day, String status, String timing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            day,
            textAlign: TextAlign.justify,
            style: AppFontStyle.customTextStyle(AppColor.defaultBlack,
                AppFontStyle.fontFamilyPoppins, FontType.medium, 12),
          ),
        ),
        Text(
          status,
          textAlign: TextAlign.justify,
          style: AppFontStyle.customTextStyle(AppColor.defaultBlack,
              AppFontStyle.fontFamilyPoppins, FontType.medium, 12),
        ),
        Text(
          timing,
          textAlign: TextAlign.justify,
          style: AppFontStyle.customTextStyle(AppColor.defaultBlack,
              AppFontStyle.fontFamilyPoppins, FontType.medium, 12),
        ),
      ],
    );
  }
}
