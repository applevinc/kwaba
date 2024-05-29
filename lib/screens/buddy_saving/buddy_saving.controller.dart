import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwaba/enums/saving_frequency.enum.dart';
import 'package:kwaba/enums/saving_type.enum.dart';

final _maxSavingDate = DateTime.now().add(const Duration(days: 365));

class BuddySavingController extends ChangeNotifier {
  BuddySavingController() {
    titleController = TextEditingController();
    amountController = TextEditingController();
    numberOfBuddiesController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
  }

  late final TextEditingController titleController;

  late final TextEditingController amountController;

  late final TextEditingController numberOfBuddiesController;

  late final TextEditingController startDateController;

  late final TextEditingController endDateController;

  bool _hasTarget = false;

  bool get hasTarget => _hasTarget;

  void setHasTarget(bool value) {
    _hasTarget = value;
    notifyListeners();
  }

  SavingType? _savingType;

  SavingType? get savingType => _savingType;

  void setSavingType(SavingType? value) {
    _savingType = value;
    notifyListeners();
  }

  SavingFrequency? _savingFrequency;

  SavingFrequency? get savingFrequency => _savingFrequency;

  void setSavingFrequency(SavingFrequency? value) {
    _savingFrequency = value;
    notifyListeners();
  }

  final List<String> _relationships = [
    'Family',
    'Friends',
    'Colleagues',
    'Cousins',
    'Acquaintances',
    'Others',
  ];

  List<String> get relationships => _relationships;

  String? _relationshipWithBuddies;

  String? get relationshipWithBuddies => _relationshipWithBuddies;

  void setRelationshipWithBuddies(String? value) {
    _relationshipWithBuddies = value;
    notifyListeners();
  }

  DateTime? _startDate;

  DateTime? get startDate => _startDate;

  void pickStartDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: _maxSavingDate,
    );

    if (date == null) {
      return;
    }

    _startDate = date;
    startDateController.text = DateFormat('dd/MM/yyyy').format(date);
    notifyListeners();
  }

  DateTime? _endDate;

  DateTime? get endDate => _endDate;

  void pickEndDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: _maxSavingDate,
    );

    if (date == null) {
      return;
    }

    _endDate = date;
    endDateController.text = DateFormat('dd/MM/yyyy').format(date);
    notifyListeners();
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    numberOfBuddiesController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}
