enum SavingFrequency {
  daily,
  weekly,
  monthly,
}

String savingFrequencyToString(SavingFrequency value) {
  switch (value) {
    case SavingFrequency.daily:
      return 'Daily';
    case SavingFrequency.weekly:
      return 'Weekly';
    case SavingFrequency.monthly:
      return 'Monthly';
  }
}

SavingFrequency stringToSavingFrequency(String value) {
  switch (value) {
    case 'Daily':
      return SavingFrequency.daily;
    case 'Weekly':
      return SavingFrequency.weekly;
    case 'Monthly':
      return SavingFrequency.monthly;
    default:
      return SavingFrequency.daily;
  }
}
