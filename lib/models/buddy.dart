class Buddy {
  Buddy({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final String id;

  final String firstName;

  final String lastName;

  String get name {
    return '$firstName $lastName';
  }
}
