import 'package:kwaba/enums/saving_frequency.enum.dart';
import 'package:kwaba/enums/saving_type.enum.dart';
import 'package:kwaba/models/amount.dart';

class CreateBuddySavingRequest {
  CreateBuddySavingRequest({
    required this.title,
    required this.numberOfBuddies,
    required this.hasTarget,
    required this.savingType,
    required this.savingFrequency,
    required this.startDate,
    required this.endDate,
    required this.amount,
    required this.relationshipWithBuddies,
  });

  final String title;
  final int numberOfBuddies;
  final bool hasTarget;
  final SavingType savingType;
  final SavingFrequency savingFrequency;
  final DateTime startDate;
  final DateTime endDate;
  final Amount amount;
  final String relationshipWithBuddies;
}
