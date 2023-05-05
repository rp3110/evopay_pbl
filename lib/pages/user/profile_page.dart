import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/profile_image_widget.dart';
import '../../widgets/page_tittle_widget.dart';
import 'package:gool_goal_app/models/user_detail.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController txtEmailController = TextEditingController();
  final TextEditingController txtFirstNameController = TextEditingController();
  final TextEditingController txtLastNameController = TextEditingController();

  final FocusNode txtEmailFocus = FocusNode();
  final FocusNode txtFirstNameFocus = FocusNode();
  final FocusNode txtLastNameFocus = FocusNode();

  final bool _isEditModeEnable = false;
  var user = User();

  @override
  void dispose() {
    txtEmailController.dispose();
    txtFirstNameController.dispose();
    txtLastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark); // 1
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLogoutWidget(),
                  const SizedBox(width: 74.0),
                  ProfileImageView(
                    isEdit: _isEditModeEnable,
                    imagePath: user.profileUrl ?? "",
                    profileImageData: user.profileImageData ?? "",
                    onClicked: () {},
                    onImageSelect: (imageFile) {},
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Column(
                children: [
                  Text("${user.firstName} ${user.lastName}",
                      style: AppFontStyle.customTextStyle(
                          AppColor.defaultBlack,
                          AppFontStyle.fontFamilyRedHatDisplay,
                          FontType.medium,
                          14.0)),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text("${user.email}",
                      style: AppFontStyle.customTextStyle(
                          AppColor.secondaryGray,
                          AppFontStyle.fontFamilyRedHatDisplay,
                          FontType.regular,
                          14.0)),
                ],
              ),
              const SizedBox(height: 30.0),
              const PageTitleWidget(title: "USER PROFILE"),
              const SizedBox(height: 20.0),
              _buildEmailWidget(),
              const SizedBox(height: 16.0),
              _buildFirstNameWidget(),
              const SizedBox(height: 16.0),
              _buildLastNameWidget(),
              const SizedBox(height: 30.0),
              _isEditModeEnable
                  ? ButtonWidget(
                      text: "Submit",
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {}
                      })
                  : const SizedBox(height: 0),
              _isEditModeEnable
                  ? const SizedBox(height: 12.0)
                  : const SizedBox(height: 0),
              !_isEditModeEnable
                  ? _buildDeleteAccountWidget()
                  : const SizedBox(height: 0),
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
        isEnabled: false,
        controller: txtEmailController,
        focusNode: txtEmailFocus,
        placeholder: "emailaddress@gmail.com",
        isReadOnly: false,
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        onSubmitField: () {
          /* _fieldFocusChange(context, txtEmailFocus, txtFirstNameFocus);*/
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

  Widget _buildFirstNameWidget() {
    return TextFieldWidget(
        name: "First Name",
        textCapitalization: TextCapitalization.words,
        isEnabled: _isEditModeEnable,
        controller: txtFirstNameController,
        focusNode: txtFirstNameFocus,
        placeholder: "First name",
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
        textCapitalization: TextCapitalization.words,
        isEnabled: _isEditModeEnable,
        controller: txtLastNameController,
        focusNode: txtLastNameFocus,
        placeholder: "Last Name",
        isReadOnly: false,
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        onSubmitField: () {
          //_fieldFocusChange(context, txtLastNameFocus, txtEmailFocus);
        },
        validations: const [TextValidation.required],
        prefixIconImage: const ImageIcon(
          AssetImage(ImagePath.icUser),
          size: 15.0,
        ),
        errorMessages: const ["Please enter your last name"]);
  }

  Widget _buildLogoutWidget() {
    return IconButton(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        constraints: const BoxConstraints(),
        iconSize: 33.0,
        icon: Image.asset(ImagePath.icLogout),
        onPressed: () {
          FocusScope.of(context).unfocus();
          CommonFunction.showAlertWithActionHandle(
              context, appName, AppMessages.logout,
              cancelTitle: AppStrings.cancel,
              okTitle: AppStrings.yes,
              onTapOk: () {
                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (Route<dynamic> route) => false);
              },
              onTapCancel: () => Navigator.pop(context));
        });
  }

  Widget _buildDeleteAccountWidget() {
    return SizedBox(
      height: 40.0,
      child: TextButton(
        child: Text(
          "Delete Account",
          style: AppFontStyle.customTextStyle(AppColor.primaryRedColor,
              AppFontStyle.fontFamilyPoppins, FontType.medium, 15.0),
        ),
        onPressed: () async {
          FocusScope.of(context).unfocus();
          CommonFunction.showAlertWithActionHandle(
              context, appName, AppMessages.deleteAccount,
              cancelTitle: AppStrings.cancel,
              okTitle: AppStrings.yes,
              onTapOk: () {
                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (Route<dynamic> route) => false);
              },
              onTapCancel: () => Navigator.pop(context));
        },
      ),
    );
  }
}
