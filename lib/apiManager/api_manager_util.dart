import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gool_goal_app/models/user_detail.dart';
import 'package:gool_goal_app/utils/api_constant.dart';
import 'api_manager.dart';
import 'package:gool_goal_app/utils/utils.dart';

class APIManagerUtils {
  //static String secretKey = ""; // TODO : Need to remove after demo purpose

  static Future<bool> checkConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      debugPrint(" APIManagerUtils:: checkConnection >> Internet Connected");
      return true;
    } else {
      debugPrint(
          " APIManagerUtils:: checkConnection >> Internet Not Connected");
      return false;
    }
  }

  static Future<bool?> apiCallGetUserProfile(BuildContext context,
      {bool isInBackground = false, bool isRefresh = false}) async {
    if (GlobalVariable.userDetail.user != null) {
      return true;
    }

    var map = <String, dynamic>{};
    if (GlobalVariable.userDetail.token?.id != null) {
      map["UserId"] = GlobalVariable.userDetail.token?.id!;
    }

    if (!isInBackground && !isRefresh) {
      EasyLoading.show();
    }

    await APIManager.instance
        .postRequest(
            requestURL: APIConstant.getUserProfile,
            requestData: map,
            context: context,
            isAuthRequired: true)
        .then((response) {
      if (!isInBackground && !isRefresh) {
        EasyLoading.dismiss();
      }
      if (response != null) {
        if (response[APIManager.statusCode] == 200) {
          //Success Response
          final responseData = response[APIManager.data];
          if (responseData != null) {
            GlobalVariable.userDetail.user = User.fromJson(responseData);
          }
        } else {
          final message = response[APIManager.message];
          if (message != null) {
            CommonFunction.showAlert(context, appName, message);
          }
        }
      }
      return true;
    });
    return null;
  }
}

/// APIManagerConstants
class APIManagerConstants {
  /// Here as per requirements you can add or modify content type
  static const String contentAccept = "application/json";
  static const String contentTypeJSON = "application/json";
  static const String contentTypeXFormURLEncoded =
      "application/x-www-form-urlencoded";

  /// Network failure manage
  static const String networkError =
      "No Internet Connection. Please check and try again.";
  static const String requestCancel = "Request to API server was cancelled";
  static const String connectionTimeout = "Connection timeout with API server";
  static const String receiveTimeout =
      "Receive timeout in connection with API server";
  static const String badCertificate =
      "Bad Certificate";
  static const String connectionError =
      "Connection Error";
}
