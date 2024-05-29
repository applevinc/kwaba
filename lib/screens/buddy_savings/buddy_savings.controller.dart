import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwaba/enums/saving_frequency.enum.dart';
import 'package:kwaba/enums/saving_type.enum.dart';
import 'package:kwaba/models/amount.dart';
import 'package:kwaba/models/create_buddy_saving.request.dart';
import 'package:kwaba/utils/constants.dart';

final _maxSavingDate = DateTime.now().add(const Duration(days: 365));

class BuddySavingsController extends ChangeNotifier {
  BuddySavingsController() {
    _currentIndex = 0;
    titleController = TextEditingController();
    amountController = TextEditingController();
    numberOfBuddiesController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
  }

  late int _currentIndex;

  int get currentIndex => _currentIndex;

  void nextPage() {
    _currentIndex++;
    notifyListeners();
  }

  void previousPage() {
    _currentIndex--;
    notifyListeners();
  }

  late final TextEditingController titleController;

  late final TextEditingController amountController;

  late final TextEditingController numberOfBuddiesController;

  late final TextEditingController startDateController;

  late final TextEditingController endDateController;

  final List<String> options = [AppConstants.yes, AppConstants.no];

  String? _option;

  String? get option => _option;

  bool get hasTarget {
    switch (option) {
      case AppConstants.yes:
        return true;
      case AppConstants.no:
        return false;
      default:
        return false;
    }
  }

  void setHasTarget(String value) {
    _option = value;
    notifyListeners();
  }

  SavingType? _savingType;

  SavingType? get savingType => _savingType;

  void setSavingType(SavingType? value) {
    _savingType = value;
    notifyListeners();
  }

  final savingFrequencies =
      SavingFrequency.values.map((e) => savingFrequencyToString(e)).toList();

  String? _savingFrequency;

  String? get savingFrequency => _savingFrequency;

  void setSavingFrequency(String value) {
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

  void setRelationshipWithBuddies(String value) {
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
    _endDate = null;
    endDateController.clear();
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

  CreateBuddySavingRequest createRequest() {
    if (startDate == null) {
      throw Exception('Please pick a start date');
    }

    if (endDate == null) {
      throw Exception('Please pick an end date');
    }

    if (savingType == null) {
      throw Exception('Please pick a saving type');
    }

    if (savingFrequency == null) {
      throw Exception('Please pick a saving frequency');
    }

    if (relationshipWithBuddies == null) {
      throw Exception('Please pick a relationship with buddies');
    }

    final amount = Amount(
      value: double.tryParse(amountController.text.replaceAll(',', '')) ?? 0.0,
    );

    return CreateBuddySavingRequest(
      title: titleController.text,
      amount: amount,
      numberOfBuddies: int.parse(numberOfBuddiesController.text),
      startDate: startDate!,
      endDate: endDate!,
      hasTarget: option == AppConstants.yes,
      savingType: savingType!,
      savingFrequency: stringToSavingFrequency(savingFrequency!),
      relationshipWithBuddies: relationshipWithBuddies!,
    );
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