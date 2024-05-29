import 'package:flutter/material.dart';
import 'package:kwaba/screens/buddy_savings/buddy_savings.controller.dart';
import 'package:kwaba/screens/buddy_savings/steps/invite_step.view.dart';
import 'package:kwaba/screens/buddy_savings/steps/step_one.view.dart';
import 'package:kwaba/screens/buddy_savings/steps/step_three.view.dart';
import 'package:kwaba/screens/buddy_savings/steps/step_two.view.dart';
import 'package:kwaba/styles/spacing.dart';
import 'package:provider/provider.dart';

class BuddySavingsScreen extends StatelessWidget {
  const BuddySavingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BuddySavingsController(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BuddySavingsController>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Buddy Savings'),
          leading: BackButton(
            onPressed: () {
              if (controller.currentIndex > 0) {
                controller.previousPage();
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: AppPadding.defaultPadding,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.8,
            child: IndexedStack(
              index: controller.currentIndex,
              children: const [
                BuddySavingsStepOneView(),
                BuddySavingsStepTwoView(),
                BuddySavingsStepThreeView(),
                BuddySavingsInviteView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
