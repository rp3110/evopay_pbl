import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dashboard/dashboard_page.dart';
import 'forgot_password_page.dart';
import 'signup_page.dart';
import 'package:gool_goal_app/widgets/page_tittle_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _txtEmailController = TextEditingController();
  final TextEditingController _txtPasswordController = TextEditingController();
  final FocusNode _txtEmailFocus = FocusNode();
  final FocusNode _txtPasswordFocus = FocusNode();
  bool isShowLoginContent = false;
  ValueNotifier<bool> isPassSecured = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    setState(() {
      isShowLoginContent = true;
    });
  }

  @override
  void dispose() {
    _txtEmailController.dispose();
    _txtPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark); // 1
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 64.0),
              Center(
                child: Image.asset(
                  ImagePath.dashboardAppLogo,
                  fit: BoxFit.scaleDown,
                  scale: 1,
                ),
              ),
              const SizedBox(height: 30.0),
              isShowLoginContent
                  ? const PageTitleWidget(title: "LOGIN")
                  : const SizedBox(),
              const SizedBox(height: 20.0),
              isShowLoginContent ? _buildEmailWidget() : const SizedBox(),
              const SizedBox(height: 16.0),
              isShowLoginContent ? _buildPasswordWidget() : const SizedBox(),
              isShowLoginContent
                  ? _buildForgotPasswordWidget()
                  : const SizedBox(),
              const SizedBox(height: 20.0),
              isShowLoginContent ? _buildLoginButtonWidget() : const SizedBox(),
              const SizedBox(height: 20.0),
              isShowLoginContent
                  ? _buildSignupRedirectWidget()
                  : const SizedBox(),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  /*_fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }*/

  Widget _buildEmailWidget() {
    return TextFieldWidget(
        name: "Email",
        autoFocus: false,
        controller: _txtEmailController,
        focusNode: _txtEmailFocus,
        keyboardType: TextInputType.emailAddress,
        placeholder: "Enter your email",
        isReadOnly: false,
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        onSubmitField: () {
          /*_fieldFocusChange(context, _txtEmailFocus, _txtPasswordFocus);*/
        },
        validations: const [TextValidation.required, TextValidation.email],
        prefixIconImage: const ImageIcon(
          AssetImage(ImagePath.icEmail),
          size: 15.0,
        ),
        errorMessages: const [
          "Please enter your email address",
          "Invalid email address"
        ]);
  }

  Widget _buildPasswordWidget() {
    return ValueListenableBuilder(
        valueListenable: isPassSecured,
        builder: (context, flag, child) {
          return TextFieldWidget(
              name: "Password",
              controller: _txtPasswordController,
              focusNode: _txtPasswordFocus,
              placeholder: "Enter your password",
              maxLine: 1,
              isSecureText: isPassSecured.value,
              onTapShow: () {
                isPassSecured.value = !isPassSecured.value;
              },
              isReadOnly: false,
              autoFocus: false,
              onSubmitField: () {},
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              validations: const [
                TextValidation.required,
                TextValidation.password
              ],
              prefixIconImage: const ImageIcon(
                AssetImage(ImagePath.icPassword),
                size: 15.0,
              ),
              errorMessages: const ["Please enter your password"]);
        });
  }

  Widget _buildLoginButtonWidget() {
    return ButtonWidget(
        text: "Login",
        onPressed: () async {
          FocusScope.of(context).unfocus();
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DashboardPage()),
            );
          }
        });
  }

  Widget _buildForgotPasswordWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: Text(
            "Forgot Password?",
            textAlign: TextAlign.right,
            style: AppFontStyle.customTextStyle(AppColor.primaryBlueColor,
                AppFontStyle.fontFamilyPoppins, FontType.medium, 14.0),
          ),
          onPressed: () async {
            FocusScope.of(context).unfocus();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ForgotPasswordPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSignupRedirectWidget() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignupPage()),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don’t have an account ?",
                  style: AppFontStyle.customTextStyle(AppColor.textBlackShade,
                      AppFontStyle.fontFamilyPoppins, FontType.regular, 14.0,
                      decoration: TextDecoration.underline, height: 2)),
              Text(
                " Sign Up",
                style: AppFontStyle.customTextStyle(AppColor.primaryBlueColor,
                    AppFontStyle.fontFamilyPoppins, FontType.semiBold, 14.0,
                    decoration: TextDecoration.underline, height: 2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
