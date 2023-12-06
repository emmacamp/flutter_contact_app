import 'dart:convert';
import 'package:app_contacts/delete_contact.dart';
import 'package:app_contacts/modify_contact.dart';
import 'package:app_contacts/register_contact.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:app_contacts/contacts.dart';
import 'package:app_contacts/message_response.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    try {
      final response = await http
          .get(Uri.parse('http://10.0.0.32:8080/contacts/getdata.php'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          contacts = data.map((json) => Contact.fromJson(json)).toList();
        });
      } else {
        throw Exception(
            'Failed to load Contacts. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al cargar la lista de contactos: $error');
    }
  }

  // void removeClient(BuildContext context, Contact contact) {
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: const Text("Eliminar Cliente"),
  //       content: Text("¿Está seguro de eliminar a ${contact.name}?"),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             contacts.remove(contact);
  //             Navigator.pop(context);
  //             setState(() {});
  //           },
  //           child: const Text(
  //             "Eliminar",
  //             style: TextStyle(color: Colors.red),
  //           ),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: const Text(
  //             "Cancelar",
  //             style: TextStyle(color: Colors.blue),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  void removeClient(BuildContext context, Contact contact) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Eliminar Cliente"),
        content: Text("¿Está seguro de eliminar a ${contact.name}?"),
        actions: [
          TextButton(
            onPressed: () {
              deleteContact(contact.id);
              Navigator.pop(context);
              setState(() {
                contacts.remove(contact);
              });
            },
            child: const Text(
              "Eliminar",
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ModifyContact(contacts[index]),
                ),
              ).then((newContact) {
                if (newContact != null) {
                  setState(() {
                    contacts.removeAt(index);
                    contacts.insert(index, newContact);
                    messageResponse(
                        context, "${newContact.name} ha sido modificado!");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, contacts[index]);
            },
            title: Text("${contacts[index].name} ${contacts[index].surname}"),
            subtitle: Text(contacts[index].phone),
            leading: CircleAvatar(
              child: Text(contacts[index].name.substring(0, 1)),
            ),
            trailing: const Icon(
              Icons.call,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RegisterContact()),
          ).then((newContact) {
            if (newContact != null) {
              setState(() {
                contacts.add(newContact);
                messageResponse(
                    context, "${newContact.name} ha sido guardado!");
              });
            }
          });
        },
        tooltip: "Agregar Contacto",
        child: const Icon(Icons.add),
      ),
    );
  }
}
