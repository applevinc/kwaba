import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kwaba/screens/buddy_savings/buddy_savings.controller.dart';
import 'package:kwaba/screens/buddy_savings/widgets/card.dart';
import 'package:kwaba/screens/buddy_savings/widgets/options.dart';
import 'package:kwaba/utils/messenger.dart';
import 'package:kwaba/widgets/amount_textfield.dart';
import 'package:kwaba/widgets/app_button.dart';
import 'package:kwaba/widgets/custom_textfield.dart';
import 'package:kwaba/widgets/dropdown.dart';
import 'package:provider/provider.dart';

class BuddySavingsStepThreeView extends StatefulWidget {
  const BuddySavingsStepThreeView({super.key});

  @override
  State<BuddySavingsStepThreeView> createState() => _BuddySavingsStepThreeViewState();
}

class _BuddySavingsStepThreeViewState extends State<BuddySavingsStepThreeView> {
  final _formKey = GlobalKey<FormState>();

  void next() {
    if (_formKey.currentState == null) {
      return;
    }

    if (_formKey.currentState!.validate()) {
      final controller = context.read<BuddySavingsController>();

      if (controller.startDate == null) {
        Messenger.show(context: context, message: 'Please pick a start date');
        return;
      }

      if (controller.endDate == null) {
        Messenger.show(context: context, message: 'Please pick an end date');
        return;
      }

      if (controller.relationshipWithBuddies == null) {
        Messenger.show(
            context: context, message: 'Please select relationship with buddies');
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
          AmountTextField(
            title: 'How much do you want to save in 12 months?',
            controller: controller.amountController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the amount you want to save';
              }

              return null;
            },
          ),
          const SizedBox(height: gap),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  title: 'Start Date',
                  hintText: 'Select',
                  controller: controller.startDateController,
                  readOnly: true,
                  onTap: () => controller.pickStartDate(context),
                  suffixIcon: const Icon(Icons.calendar_month),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter select a date';
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  title: 'End Date',
                  hintText: 'Select',
                  enabled: controller.startDate != null,
                  controller: controller.endDateController,
                  readOnly: true,
                  onTap: () => controller.pickEndDate(context),
                  suffixIcon: const Icon(Icons.calendar_month),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter select a date';
                    }

                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: gap),
          SimpleDropdown(
            title: 'Relationship with buddies',
            items: controller.relationships,
            value: controller.relationshipWithBuddies,
            onChanged: (value) {
              if (value == null) {
                return;
              }

              controller.setRelationshipWithBuddies(value);
            },
          ),
          const Spacer(flex: 4),
          AppButton(
            label: 'Next',
            onTap: next,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
