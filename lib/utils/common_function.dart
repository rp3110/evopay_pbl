import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'utils.dart';

class CommonFunction {
  static bool isDialogShowing = false;

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(
      {required BuildContext context, bool safeArea = false}) {
    var height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    var finalVal = safeArea ? height - (padding.top) : height;
    return finalVal;
  }

  static List<BoxShadow> addShadow() {
    return [
      const BoxShadow(
          color: AppColor.lightGray,
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(1, 1))
    ];
  }

  static String getDateSuffix(String val) {
    if (val.substring(val.length - 1) == '1') {
      return '${val}st';
    } else if (val.substring(val.length - 1) == '2') {
      return '${val}nd';
    } else if (val.substring(val.length - 1) == '3') {
      return '${val}rd';
    } else {
      return '${val}th';
    }
  }

  static Color getRandomColor() {
    var random = Random();
    return Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
  }

  static Future<void> showAlert(
      BuildContext context, String title, String message,
      {VoidCallback? onTapOk}) async {
    CommonFunction.isDialogShowing = true;

    if (Platform.isAndroid) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              CommonFunction.isDialogShowing = false;
              return Future(() => true);
            },
            child: AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      message,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'OK',
                  ),
                  onPressed: () {
                    CommonFunction.isDialogShowing = false;
                    if (onTapOk != null) {
                      onTapOk();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  maxLines: 10,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text(
                'OK',
              ),
              onPressed: () {
                CommonFunction.isDialogShowing = false;
                if (onTapOk != null) {
                  onTapOk();
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showAlertWithActionHandle(
      BuildContext context, String title, String message,
      {required String cancelTitle,
      required VoidCallback onTapCancel,
      required String okTitle,
      required VoidCallback onTapOk}) async {
    if (Platform.isAndroid) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    message,
                    maxLines: 10,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  cancelTitle,
                ),
                onPressed: () {
                  onTapCancel();
                },
              ),
              TextButton(
                child: Text(
                  okTitle,
                  style: const TextStyle(color: AppColor.red),
                ),
                onPressed: () {
                  onTapOk();
                },
              ),
            ],
          );
        },
      );
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  maxLines: 10,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                cancelTitle,
              ),
              onPressed: () {
                onTapCancel();
                //Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text(
                okTitle,
                style: const TextStyle(color: AppColor.red),
              ),
              onPressed: () {
                onTapOk();
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showAlertWithCompletionBack(
      BuildContext context, String title, String message,
      {required VoidCallback onTapOk}) async {
    if (Platform.isAndroid) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              CommonFunction.isDialogShowing = false;
              return Future(() => true);
            },
            child: AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      message,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'OK',
                  ),
                  onPressed: () {
                    onTapOk();
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  maxLines: 10,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                onTapOk();
              },
            ),
          ],
        );
      },
    );
  }

  static hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static AppBar buildCustomAppBarWidget(String title,
      {bool automaticallyImplyLeading = true}) {
    return AppBar(
      title: Text(title, style: AppFontStyle.navbarTitleTextStyle()),
      automaticallyImplyLeading: automaticallyImplyLeading,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColor.primaryBlueLightShade,
            AppColor.primaryBlueDarkShade
          ]),
        ),
      ),
    );
  }

  static showSnackBar(
      {required BuildContext context,
      required isError,
      required String message,
      int? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: duration ?? 3),
        backgroundColor: isError ? AppColor.red : AppColor.primaryGreen,
        content: Text(
          message,
          style: AppFontStyle.customTextStyle(AppColor.primaryWhite,
              AppFontStyle.fontFamilyPoppins, FontType.medium, 14),
        )));
  }
}
