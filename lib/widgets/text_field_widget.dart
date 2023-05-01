import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gool_goal_app/utils/utils.dart';

enum TextValidation { required, number, name, email, password, time }

class TextFieldWidget extends StatelessWidget {
  final String name;
  final String? initialValue;
  final String? placeholder;
  final int? maxLimit;
  final int? maxLine;
  final bool isSecureText;
  final Function()? onTapShow;
  final bool isReadOnly;
  final ImageIcon? prefixIconImage;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function onSubmitField;
  final Function()? onEditingComplete;
  final GestureTapCallback? onTap;
  final List<TextValidation> validations;
  final List<String> errorMessages;
  final IconButton? suffixIconButton;
  final Function(String)? onchange;
  final String? compareString;
  final bool isEnabled;
  final bool autoFocus;
  final bool hasPrefix;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization textCapitalization;

  TextFieldWidget({
    Key? key,
    required this.name,
    this.initialValue,
    this.placeholder,
    this.maxLimit,
    this.maxLine,
    this.isSecureText = false,
    this.isReadOnly = false,
    this.prefixIconImage,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.focusNode,
    required this.onSubmitField,
    this.onEditingComplete,
    this.onTap,
    required this.validations,
    required this.errorMessages,
    this.suffixIconButton,
    this.onchange,
    this.compareString,
    this.isEnabled = true,
    this.autoFocus = true,
    this.hasPrefix = true,
    this.contentPadding,
    this.textCapitalization = TextCapitalization.none,
    this.onTapShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      name.isEmpty
          ? const SizedBox()
          : Text(name, style: AppFontStyle.textFieldTitleStyle()),
      SizedBox(height: name.isEmpty ? 0 : 8),
      TextFormField(
          textCapitalization: textCapitalization,
          inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          enabled: isEnabled,
          autofocus: autoFocus,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor: AppColor.primaryBlueDarkShade,
          controller: controller,
          obscureText: isSecureText,
          readOnly: isReadOnly,
          maxLength: maxLimit,
          maxLines: isSecureText ? 1 : maxLine,
          keyboardType: keyboardType,
          /*widget.keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],*/
          style: AppFontStyle.textFieldTextStyle(),
          onChanged: onchange,
          decoration: InputDecoration(
            contentPadding: contentPadding ?? const EdgeInsets.all(15),
            prefixIcon: hasPrefix
                ? prefixIcon != null
                    ? Icon(prefixIcon, size: 20, color: AppColor.primaryBlack)
                    : //widget.prefixIconImage,
                    SizedBox(
                        width: 15.0,
                        height: 15.0,
                        child: Center(
                          child: prefixIconImage,
                        ),
                      )
                : null,
            suffixIcon: suffixIconButtonWidget(),
            hintText: placeholder,
            hintStyle: AppFontStyle.textFieldPlaceholderStyle(),
            counterStyle: AppFontStyle.customTextStyle(AppColor.red,
                AppFontStyle.fontFamilyPoppins, FontType.regular, 12.0),
            errorStyle: AppFontStyle.customTextStyle(AppColor.red,
                AppFontStyle.fontFamilyPoppins, FontType.regular, 12.0),
            border: isEnabled
                ? OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1.0, color: AppColor.primaryBlueColor),
                    borderRadius: BorderRadius.circular(10))
                : OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1.0,
                        color: AppColor.primaryTextFieldPlaceholder),
                    borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1.0, color: AppColor.primaryBlueDarkShade),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1.0, color: AppColor.primaryBlueDarkShade),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1.0, color: AppColor.primaryBlueDarkShade),
                borderRadius: BorderRadius.circular(10)),
          ),
          onFieldSubmitted: onSubmitField(),
          onEditingComplete: onEditingComplete,
          onTap: onTap,
          validator: (value) {
            String err = "";
            validations.asMap().forEach((index, element) {
              if ((element == TextValidation.required) &&
                  !isEnteredValue(value)) {
                err = errorMessages[index];
              } else if ((element == TextValidation.email) &&
                  !isValidEmail(value!)) {
                err = errorMessages[index];
              } else if ((element == TextValidation.time) &&
                  !isValidTime(value)) {
                err = errorMessages[index];
              }
            });
            if (err.isNotEmpty) {
              return err;
            }
            return null;
          })
    ]);
  }

  Widget? suffixIconButtonWidget() {
    if (isPasswordTypeField() == true) {
      return Builder(builder: (context) {
        return IconButton(
            icon: Icon(
              isSecureText ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              onTapShow!();
            });
      });
    } else {
      if (suffixIconButton != null) {
        return suffixIconButton;
      } else if (suffixIcon != null) {
        return Icon(suffixIcon, size: 20, color: AppColor.primaryBlack);
      }
      return null;
    }
  }

  bool isPasswordTypeField() {
    var isPasswordType = false;
    validations.asMap().forEach((index, element) {
      if (element == TextValidation.password) {
        isPasswordType = true;
      }
    });
    return isPasswordType;
  }

  void changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  bool isEnteredValue(String? value) {
    return value?.trim().isNotEmpty ?? false;
  }

  bool isValidEmail(String value) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return emailValid;
  }

  bool isValidTime(String? value) {
    return value != "00:00";
  }
}
