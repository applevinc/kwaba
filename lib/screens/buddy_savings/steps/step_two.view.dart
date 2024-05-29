import 'package:flutter/material.dart';
import 'package:kwaba/enums/saving_type.enum.dart';
import 'package:kwaba/screens/buddy_savings/buddy_savings.controller.dart';
import 'package:kwaba/screens/buddy_savings/widgets/options.dart';
import 'package:kwaba/styles/colors.dart';
import 'package:kwaba/styles/text.dart';
import 'package:kwaba/utils/messenger.dart';
import 'package:kwaba/widgets/app_button.dart';
import 'package:provider/provider.dart';

class BuddySavingsStepTwoView extends StatefulWidget {
  const BuddySavingsStepTwoView({super.key});

  @override
  State<BuddySavingsStepTwoView> createState() => _BuddySavingsStepTwoViewState();
}

class _BuddySavingsStepTwoViewState extends State<BuddySavingsStepTwoView> {
  final _formKey = GlobalKey<FormState>();

  void nextPage() {
    if (_formKey.currentState == null) {
      return;
    }

    if (_formKey.currentState!.validate()) {
      final controller = context.read<BuddySavingsController>();

      if (controller.savingType == null) {
        Messenger.show(context: context, message: 'Please select a saving type');
        return;
      }

      if (controller.savingFrequency == null) {
        Messenger.show(context: context, message: 'Please select a saving frequency');
        return;
      }

      controller.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    const gap = 16.0;
    final controller = context.watch<BuddySavingsController>();
    final savingType = controller.savingType;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How do you want to save?',
                style: AppText.bold600,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _SavingTypeCard(
                    title: 'Automatic',
                    description: 'I will like to be debited automatically',
                    isSelected: savingType == SavingType.automatic,
                    onTap: () {
                      controller.setSavingType(SavingType.automatic);
                    },
                  ),
                  const SizedBox(width: 10),
                  _SavingTypeCard(
                    title: 'Manual',
                    description: 'I will like to be debited manually',
                    isSelected: savingType == SavingType.manual,
                    onTap: () {
                      controller.setSavingType(SavingType.manual);
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: gap),
          OptionsView(
            title: 'What is your saving frequency?',
            options: controller.savingFrequencies,
            selectedOption: controller.savingFrequency,
            onSelected: controller.setSavingFrequency,
          ),
          const Spacer(flex: 4),
          AppButton(
            label: 'Next',
            onTap: nextPage,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _SavingTypeCard extends StatelessWidget {
  const _SavingTypeCard({
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String description;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary.withOpacity(.1) : Colors.white,
            border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppText.bold600,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: AppText.bold400.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
