import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwaba/styles/text.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextInputType? textInputType;
  final bool obscure;
  final bool? isPasswordTextField;
  final TextEditingController? controller;
  final int? inputLimit;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final int maxLines;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  final bool filled;
  final Color? fillColor;
  final bool isMultipleLine;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final TextStyle? titleStyle;
  final String? counterText;
  final TextStyle? counterStyle;

  const CustomTextField({
    super.key,
    this.title,
    this.style,
    this.labelText,
    this.hintText,
    this.hintTextStyle,
    this.labelTextStyle,
    this.textInputType,
    this.obscure = false,
    this.isPasswordTextField,
    this.controller,
    this.inputLimit,
    this.inputFormatters,
    this.readOnly = false,
    this.maxLines = 1,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.autovalidateMode,
    this.errorText,
    this.filled = true,
    this.fillColor,
    this.isMultipleLine = false,
    this.border,
    this.contentPadding,
    this.textCapitalization = TextCapitalization.none,
    this.prefixText,
    this.prefixStyle,
    this.titleStyle,
    this.counterText,
    this.counterStyle,
  });

  @override
  Widget build(BuildContext context) {
    final field = TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: style ?? AppText.bold500,
      textCapitalization: textCapitalization,
      keyboardType: textInputType,
      obscureText: obscure,
      maxLength: inputLimit,
      textInputAction: textInputAction,
      onTap: onTap,
      maxLines: (obscure == true) ? 1 : maxLines,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixText: prefixText,
        prefixStyle: prefixStyle,
        counterText: counterText,
        counterStyle: counterStyle,
        filled: filled,
        fillColor: fillColor ?? Colors.transparent,
        errorText: errorText,
        contentPadding: contentPadding,
        labelText: labelText,
        hintText: hintText,
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 25,
          minHeight: 25,
        ),
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 25,
          minHeight: 25,
        ),
        hintStyle: hintTextStyle,
        labelStyle: labelTextStyle,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
        disabledBorder: border,
      ),
    );

    if (title != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: titleStyle ?? AppText.bold600,
          ),
          const SizedBox(height: 8),
          field,
        ],
      );
    } else {
      return field;
    }
  }
}
