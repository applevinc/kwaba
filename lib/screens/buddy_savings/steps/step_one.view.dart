import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kwaba/screens/buddy_savings/buddy_savings.controller.dart';
import 'package:kwaba/screens/buddy_savings/widgets/card.dart';
import 'package:kwaba/screens/buddy_savings/widgets/options.dart';
import 'package:kwaba/utils/messenger.dart';
import 'package:kwaba/widgets/app_button.dart';
import 'package:kwaba/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class BuddySavingsStepOneView extends StatefulWidget {
  const BuddySavingsStepOneView({super.key});

  @override
  State<BuddySavingsStepOneView> createState() => _BuddySavingsStepOneViewState();
}

class _BuddySavingsStepOneViewState extends State<BuddySavingsStepOneView> {
  final _formKey = GlobalKey<FormState>();

  void nextPage() {
    if (_formKey.currentState == null) {
      return;
    }

    if (_formKey.currentState!.validate()) {
      final controller = context.read<BuddySavingsController>();

      if (controller.option == null) {
        Messenger.show(context: context, message: 'Please select an option');
        return;
      }

      controller.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    const gap = 16.0;
    final controller = context.watch<BuddySavingsController>();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BuddySavingsCardView(),
          CustomTextField(
            title: 'Give your buddy saving a title',
            controller: controller.titleController,
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the title of the buddy saving';
              }

              return null;
            },
          ),
          const SizedBox(height: gap),
          CustomTextField(
            title: 'How many buddies will be saving with you?',
            controller: controller.numberOfBuddiesController,
            textInputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the number of buddies';
              }

              return null;
            },
          ),
          const SizedBox(height: gap),
          OptionsView(
            title: 'Do you and your buddies have a target?',
            options: controller.options,
            selectedOption: controller.option,
            onSelected: controller.setHasTarget,
          ),
          const Spacer(),
          AppButton(
            label: 'Next',
            onTap: nextPage,
          ),
        ],
      ),
    );
  }
}
