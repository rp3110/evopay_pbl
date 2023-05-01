import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../apiManager/api_manager.dart';
import '../../utils/api_constant.dart';
import '../../utils/shared_preferences.dart';
import '../../utils/utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/page_tittle_widget.dart';
import 'login_page.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController txtCurrentPasswordController =
      TextEditingController();
  final TextEditingController txtNewPasswordController =
      TextEditingController();
  final TextEditingController txtConfirmPasswordController =
      TextEditingController();

  final FocusNode txtCurrentPasswordFocus = FocusNode();
  final FocusNode txtNewPasswordFocus = FocusNode();
  final FocusNode txtConfirmPasswordFocus = FocusNode();

  ValueNotifier<bool> isCurrentPassSecured = ValueNotifier<bool>(true);
  ValueNotifier<bool> isNewPassSecured = ValueNotifier<bool>(true);
  ValueNotifier<bool> isConfirmPassSecured = ValueNotifier<bool>(true);

  String passwordString = "";

  @override
  void dispose() {
    txtCurrentPasswordController.dispose();
    txtNewPasswordController.dispose();
    txtConfirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 64.0),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    constraints: const BoxConstraints(),
                    iconSize: 24.0,
                    icon: Image.asset(ImagePath.icArrowBack),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              const SizedBox(height: 30.0),
              const PageTitleWidget(title: "CHANGE PASSWORD"),
              const SizedBox(height: 20.0),
              _buildCurrentPasswordWidget(),
              const SizedBox(height: 16.0),
              _buildNewPasswordWidget(),
              const SizedBox(height: 16.0),
              _buildConfirmPasswordWidget(),
              const SizedBox(height: 30.0),
              ButtonWidget(
                  text: "Change Password",
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      if (txtNewPasswordController.text !=
                          txtConfirmPasswordController.text) {
                        CommonFunction.showSnackBar(
                            context: context,
                            isError: true,
                            message:
                                "New password and confirm password must be same.");
                      } else {
                        apiCallChangePassword();
                      }
                    }
                  }),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  /* _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }*/

  Widget _buildCurrentPasswordWidget() {
    return ValueListenableBuilder(
        valueListenable: isCurrentPassSecured,
        builder: (context, flag, child) {
          return TextFieldWidget(
              name: "Current Password",
              controller: txtCurrentPasswordController,
              focusNode: txtCurrentPasswordFocus,
              placeholder: "Enter current password",
              maxLine: 1,
              isSecureText: isCurrentPassSecured.value,
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              onTapShow: () {
                isCurrentPassSecured.value = !isCurrentPassSecured.value;
              },
              isReadOnly: false,
              onSubmitField: () {
                /* _fieldFocusChange(
                    context, txtCurrentPasswordFocus, txtNewPasswordFocus);*/
              },
              validations: const [
                TextValidation.required,
                TextValidation.password
              ],
              prefixIconImage: const ImageIcon(
                AssetImage(ImagePath.icPassword),
                size: 15.0,
              ),
              errorMessages: const ["Please enter your current password"]);
        });
  }

  Widget _buildNewPasswordWidget() {
    return ValueListenableBuilder(
        valueListenable: isNewPassSecured,
        builder: (context, flag, child) {
          return TextFieldWidget(
              name: "New Password",
              controller: txtNewPasswordController,
              focusNode: txtNewPasswordFocus,
              placeholder: "Enter new password",
              maxLine: 1,
              isSecureText: isNewPassSecured.value,
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              onTapShow: () {
                isNewPassSecured.value = !isNewPassSecured.value;
              },
              isReadOnly: false,
              onSubmitField: () {
                /*  _fieldFocusChange(
                    context, txtNewPasswordFocus, txtConfirmPasswordFocus);*/
              },
              validations: const [
                TextValidation.required,
                TextValidation.password
              ],
              prefixIconImage: const ImageIcon(
                AssetImage(ImagePath.icPassword),
                size: 15.0,
              ),
              errorMessages: const ["Please enter your new password"]);
        });
  }

  Widget _buildConfirmPasswordWidget() {
    return ValueListenableBuilder(
        valueListenable: isConfirmPassSecured,
        builder: (context, flag, child) {
          return TextFieldWidget(
              name: "Confirm Password",
              controller: txtConfirmPasswordController,
              focusNode: txtConfirmPasswordFocus,
              placeholder: "Enter your confirm password",
              maxLine: 1,
              isSecureText: isConfirmPassSecured.value,
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              onTapShow: () {
                isConfirmPassSecured.value = !isConfirmPassSecured.value;
              },
              isReadOnly: false,
              onSubmitField: () {},
              compareString: passwordString,
              validations: const [
                TextValidation.required,
                TextValidation.password
              ],
              prefixIconImage: const ImageIcon(
                AssetImage(ImagePath.icPassword),
                size: 15.0,
              ),
              errorMessages: const ["Please enter your confirm password"]);
        });
  }

  Future<void> apiCallChangePassword() async {
    var map = <String, dynamic>{};
    map["Id"] = GlobalVariable.userDetail.token?.id;
    map["CurrentPassword"] = txtCurrentPasswordController.text;
    map["NewPassword"] = txtNewPasswordController.text;

    EasyLoading.show();

    APIManager.instance
        .postRequest(
            requestURL: APIConstant.changePassword,
            requestData: map,
            context: context,
            isAuthRequired: true)
        .then((response) {
      EasyLoading.dismiss();
      if (response != null) {
        if (response[APIManager.statusCode] == 200) {
          const message = "Your password has been successfully changed. "
              "Please log in with new password.";
          CommonFunction.showSnackBar(
              context: context, isError: false, message: message);
          clearDataToFreshLogin();
        } else {
          //Failure Response
          final message = response[APIManager.message];
          if (message != null) {
            CommonFunction.showSnackBar(
                context: context, isError: true, message: message);
          }
        }
      }
    });
  }

  void clearDataToFreshLogin() {
    GlobalVariable.isInitiateAppForDefaultLogin = false;
    GlobalVariable.userDetail.token = null;
    GlobalVariable.userDetail.user = null;
    Preferences.removeUserDetail();
    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false);
    });
  }
}
