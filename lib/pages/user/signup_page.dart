import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/profile_image_widget.dart';
import '../../widgets/page_tittle_widget.dart';
import '../terms_and_condition_page/terms_and_condition_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController txtFirstNameController = TextEditingController();
  final TextEditingController txtLastNameController = TextEditingController();
  final TextEditingController txtEmailController = TextEditingController();
  final TextEditingController txtPasswordController = TextEditingController();
  final TextEditingController txtConfirmPasswordController =
      TextEditingController();

  final FocusNode txtFirstNameFocus = FocusNode();
  final FocusNode txtLastNameFocus = FocusNode();
  final FocusNode txtEmailFocus = FocusNode();
  final FocusNode txtPasswordFocus = FocusNode();
  final FocusNode txtConfirmPasswordFocus = FocusNode();

  ValueNotifier<bool> isNewPassSecured = ValueNotifier<bool>(true);
  ValueNotifier<bool> isConfirmPassSecured = ValueNotifier<bool>(true);

  String passwordString = "";
  bool _isTermsChecked = false;

  @override
  void dispose() {
    txtFirstNameController.dispose();
    txtLastNameController.dispose();
    txtEmailController.dispose();
    txtPasswordController.dispose();
    txtConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      constraints: const BoxConstraints(),
                      iconSize: 24.0,
                      icon: Image.asset(ImagePath.icArrowBack),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      }),
                  Expanded(
                    child: ProfileImageView(
                      isEdit: true,
                      imagePath: "",
                      profileImageData: "",
                      onClicked: () {},
                      onImageSelect: (imageFile) {},
                    ),
                  ),
                  const SizedBox(
                    width: 24.0,
                  )
                ],
              ),
              const SizedBox(height: 30.0),
              const PageTitleWidget(title: "SIGN UP"),
              const SizedBox(height: 20.0),
              _buildFirstNameWidget(),
              const SizedBox(height: 16.0),
              _buildLastNameWidget(),
              const SizedBox(height: 16.0),
              _buildEmailWidget(),
              const SizedBox(height: 16.0),
              _buildPasswordWidget(),
              const SizedBox(height: 16.0),
              _buildConfirmPasswordWidget(),
              const SizedBox(height: 6.0),
              _buildTermsPrivacyWidget(),
              const SizedBox(height: 20.0),
              ButtonWidget(
                  text: "Sign Up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (txtPasswordController.text !=
                          txtConfirmPasswordController.text) {
                        CommonFunction.showSnackBar(
                            context: context,
                            isError: true,
                            message:
                                "Password and confirm password must be same.");
                      } else if (_isTermsChecked == false) {
                        CommonFunction.showSnackBar(
                            context: context,
                            isError: true,
                            message: "Please accept terms and conditions");
                      } else {
                        Navigator.pop(context);
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

/*
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }*/

  Widget _buildFirstNameWidget() {
    return TextFieldWidget(
        name: "First Name",
        autoFocus: false,
        controller: txtFirstNameController,
        textCapitalization: TextCapitalization.words,
        focusNode: txtFirstNameFocus,
        placeholder: "Enter your first name",
        isReadOnly: false,
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        onSubmitField: () {
          /* _fieldFocusChange(context, txtFirstNameFocus, txtLastNameFocus);*/
        },
        validations: const [TextValidation.required],
        prefixIconImage: const ImageIcon(
          AssetImage(ImagePath.icUser),
          size: 15.0,
        ),
        errorMessages: const ["Please enter your first name"]);
  }

  Widget _buildLastNameWidget() {
    return TextFieldWidget(
        name: "Last Name",
        autoFocus: false,
        textCapitalization: TextCapitalization.words,
        controller: txtLastNameController,
        focusNode: txtLastNameFocus,
        placeholder: "Enter your last name",
        isReadOnly: false,
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        onSubmitField: () {
          /*_fieldFocusChange(context, txtLastNameFocus, txtEmailFocus);*/
        },
        validations: const [TextValidation.required],
        prefixIconImage: const ImageIcon(
          AssetImage(ImagePath.icUser),
          size: 15.0,
        ),
        errorMessages: const ["Please enter your last name"]);
  }

  Widget _buildEmailWidget() {
    return TextFieldWidget(
        name: "Email",
        controller: txtEmailController,
        focusNode: txtEmailFocus,
        placeholder: "Enter your email",
        keyboardType: TextInputType.emailAddress,
        isReadOnly: false,
        autoFocus: false,
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        onSubmitField: () {
          /*
          _fieldFocusChange(context, txtEmailFocus, txtPasswordFocus);*/
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
        valueListenable: isNewPassSecured,
        builder: (context, flag, child) {
          return TextFieldWidget(
              name: "Password",
              controller: txtPasswordController,
              focusNode: txtPasswordFocus,
              placeholder: "Enter your password",
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              onTapShow: () {
                isNewPassSecured.value = !isNewPassSecured.value;
              },
              maxLine: 1,
              isSecureText: isNewPassSecured.value,
              isReadOnly: false,
              autoFocus: false,
              onSubmitField: () {
                /*         _fieldFocusChange(
                    context, txtPasswordFocus, txtConfirmPasswordFocus);*/
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
              isReadOnly: false,
              autoFocus: false,
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              onTapShow: () {
                isConfirmPassSecured.value = !isConfirmPassSecured.value;
              },
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

  Widget _buildTermsPrivacyWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
            constraints: const BoxConstraints(),
            iconSize: 15.0,
            icon: _isTermsChecked
                ? Image.asset(
                    ImagePath.icCheckedBox,
                    height: 15,
                    width: 15,
                    fit: BoxFit.scaleDown,
                  )
                : Image.asset(
                    ImagePath.icUncheck,
                    height: 15,
                    width: 15,
                    fit: BoxFit.scaleDown,
                  ),
            onPressed: () {
              setState(() {
                _isTermsChecked = !_isTermsChecked;
              });
            }),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          child: Text("I accept all terms & conditions.",
              style: AppFontStyle.customTextStyle(AppColor.textBlackShade,
                  AppFontStyle.fontFamilyPoppins, FontType.regular, 12.0,
                  decoration: TextDecoration.underline, height: 2)),
          onTap: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const TermsAndConditionPage();
              },
            ));
            //print("Terms privacy link");
          },
        ),
      ],
    );
  }
}
