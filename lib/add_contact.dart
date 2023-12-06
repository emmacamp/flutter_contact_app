import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> addContact(String name, String surname, String phone) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.0.32:8080/contacts/add_contact.php'),
      body: {
        'name': name,
        'surname': surname,
        'phone': phone,
      },
    );

    if (response.statusCode == 200) {
      print("Contacto añadido correctamente");
      
    } else {
      throw Exception(
          'Failed to add contact. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error al añadir el contacto: $error');
  }
}
