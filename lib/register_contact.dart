import 'package:app_contacts/add_contact.dart';
import 'package:app_contacts/contacts.dart';
import 'package:app_contacts/text_box.dart';
import 'package:flutter/material.dart';

class RegisterContact extends StatefulWidget {
  const RegisterContact({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<RegisterContact> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerSurname = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void saveContact(BuildContext context) {
    String name = controllerName.text.trim();
    String surname = controllerSurname.text.trim();
    String phone = controllerPhone.text.trim();

    if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
      Navigator.pop(
        context,
        Contact(name: name, surname: surname, phone: phone),
      );
      addContact(name, surname, phone);
    } else {
      // Mostrar un mensaje de error o realizar alguna acción adicional
      // cuando los campos están vacíos.
      // Puedes agregar un SnackBar o un AlertDialog, por ejemplo.
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Contactos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextBox(controllerName, "Nombre"),
            TextBox(controllerSurname, "Apellido"),
            TextBox(controllerPhone, "Teléfono"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => saveContact(context),
              child: const Text("Guardar Contacto"),
            ),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text("Registrar Contactos"),
  //       ),
  //       body: ListView(
  //         children: [
  //           TextBox(controllerName, "Nombre"),
  //           TextBox(controllerSurname, "Apellido"),
  //           TextBox(controllerPhone, "Telefono"),
  //           ElevatedButton(
  //               onPressed: () {}, child: const Text("Guardar Contacto")),
  //         ],
  //       ));
  // }

}

// Asegúrate de importar la clase Contact

// class RegisterContactScreen extends StatelessWidget {
//   final TextEditingController controllerName = TextEditingController();
//   final TextEditingController controllerSurname = TextEditingController();
//   final TextEditingController controllerPhone = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Registrar Contactos"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextBox(controllerName, "Nombre"),
//             TextBox(controllerSurname, "Apellido"),
//             TextBox(controllerPhone, "Teléfono"),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => saveContact(context),
//               child: const Text("Guardar Contacto"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void saveContact(BuildContext context) {
//     String name = controllerName.text.trim();
//     String surname = controllerSurname.text.trim();
//     String phone = controllerPhone.text.trim();

//     if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
//       Navigator.pop(
//         context,
//         Contact(name: name, surname: surname, phone: phone),
//       );
//       addContact(name, surname, phone);
//     } else {
//       // Mostrar un mensaje de error o realizar alguna acción adicional
//       // cuando los campos están vacíos.
//       // Puedes agregar un SnackBar o un AlertDialog, por ejemplo.
//     }
//   }
// }

class TextBox extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const TextBox(this.controller, this.labelText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
