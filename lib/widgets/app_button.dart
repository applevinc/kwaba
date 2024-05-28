import 'package:flutter/material.dart';
import 'package:kwaba/styles/text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.backgroundColor,
    this.disabled = false,
    this.isBusy = false,
    this.width,
    this.shape,
    this.labelStyle,
  });

  final String label;
  final Function() onTap;
  final Color? backgroundColor;
  final bool disabled;
  final bool isBusy;
  final double? width;
  final TextStyle? labelStyle;
  final OutlinedBorder? shape;

  void Function()? get onPressed {
    if (isBusy) {
      return null;
    }

    if (disabled) {
      return null;
    }

    return onTap;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: shape,
          elevation: 0.0,
        ),
        child: Text(
          label,
          style: labelStyle ??
              AppText.bold600.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
