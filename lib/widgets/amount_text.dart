import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwaba/models/amount.dart';
import 'package:kwaba/styles/text.dart';
import 'package:kwaba/utils/constants.dart';

class AmountText extends StatelessWidget {
  const AmountText(this.amount, {super.key, this.style});

  final Amount amount;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final value = amount.value;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppConstants.naira,
            style: AppText.bold700.copyWith(
              fontSize: style?.fontSize,
            ),
          ),
          TextSpan(
            text: NumberFormat.currency(symbol: '').format(value),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style ??
          AppText.bold600.copyWith(
            fontSize: 12,
          ),
    );
  }
}
