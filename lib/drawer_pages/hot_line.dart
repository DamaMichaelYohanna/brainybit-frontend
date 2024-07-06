import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:brainybit/colorScheme.dart';

class HotLine extends StatelessWidget {
  const HotLine({super.key});

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mine,
        foregroundColor: Colors.white,
        title: const Text("HotLines"),
      ),
      body: ListView(
        children: const [
          ContactList(
              contact: "08063314090",
              contactName: "School Clinic",
              iconName: Icons.local_hospital),
          Divider(
            height: 1,
            color: Color.fromARGB(255, 249, 247, 247),
          ),
          ContactList(
            contact: "07063109604",
            contactName: "Security Unit",
            iconName: Icons.security,
          ),
          Divider(
            height: 1,
            color: Color.fromARGB(255, 249, 247, 247),
          ),
          ContactList(
            contact: "08080237035",
            contactName: "Fire Service",
            iconName: Icons.fire_truck,
          ),
        ],
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  final String contact;
  final String contactName;
  final IconData iconName;
  const ContactList(
      {super.key,
      required this.contact,
      required this.contactName,
      required this.iconName});

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contactName),
      subtitle: Text(contact),
      trailing: IconButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: contact));
            final snackBar = SnackBar(
              content: const Text('Copied to clibboard'),
              // backgroundColor: returnValue ? Colors.green : Colors.red,
              action: SnackBarAction(
                label: '',
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(
            Icons.copy_all,
            color: mine,
          )),
      leading: CircleAvatar(child: Icon(iconName)),
      onTap: () {
        _launchUrl(Uri.parse('tel:$contact'));
      },
    );
  }
}
