import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kwaba/enums/saving_frequency.enum.dart';
import 'package:kwaba/models/buddy.dart';
import 'package:kwaba/screens/buddy_savings/buddy_savings.controller.dart';
import 'package:kwaba/screens/buddy_savings/sheets/buddies.sheet.dart';
import 'package:kwaba/styles/colors.dart';
import 'package:kwaba/styles/text.dart';
import 'package:kwaba/widgets/amount_text.dart';
import 'package:kwaba/widgets/custom_switch.dart';
import 'package:provider/provider.dart';

class BuddySavingsInviteView extends StatefulWidget {
  const BuddySavingsInviteView({super.key});

  @override
  State<BuddySavingsInviteView> createState() => _BuddySavingsInviteViewState();
}

class _BuddySavingsInviteViewState extends State<BuddySavingsInviteView> {
  void addBuddy() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const BuddiesSheet(),
    );

    if (!mounted) {
      return;
    }

    if (result is Buddy) {
      context.read<BuddySavingsController>().addBuddy(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BuddySavingsController>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invite Buddy',
            style: AppText.bold600.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'An invite will be sent to any of your buddy you add to this saving plan',
            style: AppText.bold500.copyWith(
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 16),
          const _CardView(),
          if (controller.canAddBuddy)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.center,
                child: TextButton.icon(
                  onPressed: addBuddy,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Buddy'),
                ),
              ),
            ),
          const _BuddiesView(),
        ],
      ),
    );
  }
}

class _CardView extends StatelessWidget {
  const _CardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BuddySavingsController>();
    final savingFrequency = controller.selectedSavingFrequency;
    final startDate = controller.startDate;
    final endDate = controller.endDate;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [Colors.blue, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Target Amount',
            style: AppText.bold600.copyWith(
              fontSize: 12,
              color: AppColors.greyKarl,
            ),
          ),
          const SizedBox(height: 4),
          AmountText(
            controller.targetAmount,
            style: AppText.bold600.copyWith(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          UnconstrainedBox(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xff595ca0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: RichText(
                text: TextSpan(
                  text: 'You are saving with ',
                  style: AppText.bold400.copyWith(
                    color: const Color.fromARGB(255, 192, 194, 242),
                    fontSize: 12,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${controller.numberOfBuddies} buddies',
                      style: AppText.bold400.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (savingFrequency != null)
                    item(
                      context: context,
                      title: 'Frequency',
                      subtitle: savingFrequencyToString(savingFrequency),
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  item(
                    context: context,
                    title: 'Intereast',
                    subtitle: '2.5% PA',
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (startDate != null)
                    item(
                      context: context,
                      title: 'Start Date',
                      subtitle: DateFormat('MMM dd, yyyy').format(startDate),
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  if (endDate != null)
                    item(
                      context: context,
                      title: 'End Date',
                      subtitle: DateFormat('MMM dd, yyyy').format(endDate),
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(color: AppColors.grey.withOpacity(.5)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lock Savings?',
                style: AppText.bold600.copyWith(
                  color: Colors.white,
                ),
              ),
              CustomSwitch(
                value: controller.locked,
                onChanged: (value) => controller.toggleLock(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xff595ca0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'You can\'t withdraw your savings until the set maturity date',
              textAlign: TextAlign.center,
              style: AppText.bold500.copyWith(
                color: const Color.fromARGB(255, 192, 194, 242),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget item({
    required BuildContext context,
    required String title,
    required String subtitle,
    required CrossAxisAlignment crossAxisAlignment,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: AppText.bold400.copyWith(
            fontSize: 12,
            color: AppColors.greyKarl,
          ),
        ),
        Text(
          subtitle,
          style: AppText.bold600.copyWith(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _BuddiesView extends StatelessWidget {
  const _BuddiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final buddies = context.watch<BuddySavingsController>().buddies;

    return ListView.separated(
      shrinkWrap: true,
      itemCount: buddies.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      itemBuilder: (context, index) {
        final buddy = buddies[index];
        return item(buddy: buddy, context: context);
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  Widget item({
    required BuildContext context,
    required Buddy buddy,
  }) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(buddy.name),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {
            context.read<BuddySavingsController>().removeBuddy(buddy);
          },
          child: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
