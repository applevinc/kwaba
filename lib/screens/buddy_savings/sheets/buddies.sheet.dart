import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:kwaba/models/buddy.dart';
import 'package:kwaba/styles/text.dart';

class BuddiesSheet extends StatefulWidget {
  const BuddiesSheet({super.key});

  @override
  State<BuddiesSheet> createState() => _BuddiesSheetState();
}

class _BuddiesSheetState extends State<BuddiesSheet> {
  List<Buddy> buddies = [];

  @override
  void initState() {
    super.initState();
    final faker = Faker();
    buddies = List.generate(
      10,
      (index) => Buddy(
        id: index.toString(),
        firstName: faker.person.firstName(),
        lastName: faker.person.lastName(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Buddies',
            style: AppText.bold600.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 400,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: buddies.length,
              padding: const EdgeInsets.only(bottom: 40),
              itemBuilder: (context, index) {
                final buddy = buddies[index];
                return _Buddy(buddy);
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          )
        ],
      ),
    );
  }
}

class _Buddy extends StatelessWidget {
  const _Buddy(this.buddy, {super.key});

  final Buddy buddy;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, buddy);
      },
      child: Row(
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
            child: Text(
              buddy.name,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
