import 'package:http/http.dart' as http;

Future<void> deleteContact(String id) async {
  try {
    final response = await http.delete(
        Uri.parse('http://10.0.0.32:8080/contacts/delete_contact.php?id=$id'));
  print("Eliminando contacto con id: $id");

    if (response.statusCode == 200) {
      print("Contacto eliminado correctamente");
    } else {
      throw Exception(
          'Failed to delete contact. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error al eliminar el contacto: $error');
  }
}
