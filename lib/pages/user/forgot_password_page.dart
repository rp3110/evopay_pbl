import 'package:flutter/material.dart';
import 'package:gool_goal_app/widgets/page_tittle_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../utils/utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _txtEmailController = TextEditingController();
  final FocusNode txtEmailFocus = FocusNode();

  @override
  void dispose() {
    _txtEmailController.dispose();
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
                    child: Image.asset(
                      ImagePath.forgotPassword,
                      fit: BoxFit.scaleDown,
                      scale: 1,
                    ),
                  ),
                  const SizedBox(
                    width: 24.0,
                  )
                ],
              ),
              const SizedBox(height: 30.0),
              const PageTitleWidget(title: "FORGOT PASSWORD"),
              const SizedBox(height: 20.0),
              _buildEmailWidget(),
              const SizedBox(height: 20.0),
              ButtonWidget(
                  text: "Submit",
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  }),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailWidget() {
    return TextFieldWidget(
        name: "Email",
        controller: _txtEmailController,
        autoFocus: false,
        focusNode: txtEmailFocus,
        keyboardType: TextInputType.emailAddress,
        placeholder: "Enter your email",
        isReadOnly: false,
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        onSubmitField: () {
          //FocusScope.of(context).requestFocus(txtEmailFocus);
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
}
