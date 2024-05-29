import 'package:flutter/material.dart';
import 'package:kwaba/styles/colors.dart';
import 'package:kwaba/styles/text.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({
    super.key,
    required this.title,
    required this.options,
    this.selectedOption,
    required this.onSelected,
  });

  final String title;
  final List<String> options;
  final String? selectedOption;
  final void Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppText.bold600,
        ),
        const SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          itemCount: options.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final option = options[index];
            final isSelected = option == selectedOption;

            return _Option(
              option,
              isSelected: isSelected,
              onTap: () => onSelected(option),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 4),
        )
      ],
    );
  }
}

class _Option extends StatelessWidget {
  const _Option(
    this.option, {
    required this.isSelected,
    required this.onTap,
  });

  final String option;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? AppColors.primary : AppColors.grey,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            option,
            style: AppText.bold500.copyWith(
              color: isSelected ? AppColors.primary : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
