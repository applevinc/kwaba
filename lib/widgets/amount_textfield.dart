import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kwaba/utils/constants.dart';
import 'package:kwaba/widgets/custom_textfield.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({
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
  });

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

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textInputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      title: title,
      labelText: labelText,
      hintText: hintText,
      hintTextStyle: hintTextStyle,
      labelTextStyle: labelTextStyle,
      obscure: obscure,
      isPasswordTextField: isPasswordTextField,
      controller: controller,
      inputLimit: inputLimit,
      readOnly: readOnly,
      maxLines: maxLines,
      prefix: prefix,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffixText: suffixText,
      validator: validator,
      textInputAction: textInputAction,
      onTap: onTap,
      autovalidateMode: autovalidateMode,
      errorText: errorText,
      filled: filled,
      fillColor: fillColor,
      isMultipleLine: isMultipleLine,
      border: border,
      contentPadding: contentPadding,
      textCapitalization: textCapitalization,
      style: style,
      prefixText: AppConstants.naira,
      onChanged: (value) {
        final string = NumberFormat.decimalPattern('en_US')
            .format(int.parse(value.replaceAll(',', '')));
        controller?.value = TextEditingValue(
          text: string,
          selection: TextSelection.collapsed(offset: string.length),
        );
      },
    );
  }
}
