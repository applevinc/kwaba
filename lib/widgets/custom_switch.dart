import 'package:flutter/material.dart';
import 'package:kwaba/styles/colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    this.size,
    required this.onChanged,
  });

  final bool value;
  final double? size;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: FittedBox(
        child: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          inactiveTrackColor: Colors.white.withOpacity(.5),
          inactiveThumbColor: Colors.white,
          activeTrackColor: AppColors.greyKarl.withOpacity(.5),
          thumbColor: MaterialStateProperty.resolveWith(
            (states) => AppColors.primary,
          ),
        ),
      ),
    );
  }
}
