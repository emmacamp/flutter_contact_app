class Contact {
  final String id;
  final String name;
  final String surname;
  final String phone;

  Contact({
    this.id = "",
    required this.name,
    required this.surname,
    required this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      phone: json['phone'] as String,
    );
  }
}
