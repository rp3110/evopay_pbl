/// APIConstants
class APIConstant {
  /// Server
  static var baseUrl = "https://goolgoalapi.azurewebsites.net/api/";

  /// LogIn
  static var login = "${APIConstant.baseUrl}Authenticate/Login";
  static var register = "${APIConstant.baseUrl}Authenticate/Register";
  static var refreshToken = "${APIConstant.baseUrl}Authenticate/refresh-token";
  static var getUserProfile = "${APIConstant.baseUrl}User/GetUserProfile";
  static var updateUserProfile = "${APIConstant.baseUrl}User/UpdateProfile";
  static var deleteAccount = "${APIConstant.baseUrl}User/DeleteAccount";
  static var logout = "${APIConstant.baseUrl}User/logout";
  static var changePassword = "${APIConstant.baseUrl}User/ChangePassword";
  static var forgotPassword =
      "${APIConstant.baseUrl}Authenticate/ForgotPassword";

/*  static setupEnvironmentRunTime() {
    // TODO : Currently Given Temp Dev URLS on developer setup
    switch (GlobalVariable.currentEnvironment) {
      case BuildEnvironment.dev:
        debugPrint("********* GoolGoal BuildEnvironment.dev ***************");
        APIConstant.baseUrl = "https://goolgoal.avidclan.com/api/";
        break;
      case BuildEnvironment.staging:
        debugPrint(
            "********* GoolGoal BuildEnvironment.staging ***************");
        APIConstant.baseUrl = "https://goolgoal.avidclan.com/api/";
        break;
      case BuildEnvironment.live:
        debugPrint("********* GoolGoal BuildEnvironment.live ***************");
        APIConstant.baseUrl = "https://goolgoal.avidclan.com/api/";
        break;
      default:
        debugPrint(
            "********* GoolGoal Default::BuildEnvironment.live ***************");
        APIConstant.baseUrl = "https://goolgoal.avidclan.com/api/";
        break;
    }

    /// LogIn
    APIConstant.login = "${APIConstant.baseUrl}Authenticate/Login";
    APIConstant.register = "${APIConstant.baseUrl}Authenticate/Register";
    APIConstant.refreshToken =
        "${APIConstant.baseUrl}Authenticate/refresh-token";
    APIConstant.getUserProfile = "${APIConstant.baseUrl}User/GetUserProfile";
    APIConstant.updateUserProfile = "${APIConstant.baseUrl}User/UpdateProfile";
    APIConstant.deleteAccount = "${APIConstant.baseUrl}User/DeleteAccount";
    APIConstant.logout = "${APIConstant.baseUrl}User/logout";
    APIConstant.changePassword = "${APIConstant.baseUrl}User/ChangePassword";
    APIConstant.forgotPassword =
        "${APIConstant.baseUrl}Authenticate/ForgotPassword";
  }*/
}
