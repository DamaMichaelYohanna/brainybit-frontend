import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konnet/colorScheme.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final Uri _url = Uri.parse('https://flutter.dev');
  // function to copy account number to clipboard
  void copyAccountNumber(String acc) {
    Clipboard.setData(ClipboardData(text: "$acc"));
  }

  // function to open a url
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  //  function to send mail
  _sendingMails() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      // query: encodeQueryParameters(<String, String>{
      //   'subject': 'Example Subject & Symbols are allowed!',
      // }),
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donation"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 12),
              height: 150,
              width: 100,
              child: Image.asset("assets/images/donation.png")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Text(
              "By Donating, you will be helping us train "
              "and maintain the AI model among others at minimal cost",
              style: TextStyle(fontSize: 16, color: mine.shade900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Text(
              "This also means that you will"
              " continue to enjoy ads free services.",
              style: TextStyle(fontSize: 16, color: mine.shade900),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              title: const Text("0097164640"),
              subtitle: const Text("Account Number"),
              trailing: IconButton(
                  onPressed: () {
                    copyAccountNumber("0097164640");
                    final snackBar = SnackBar(
                      content: const Text("Account Copied"),
                      backgroundColor: mine,
                      action: SnackBarAction(
                        label: '',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: mine,
                  )),
            ),
          ),
          const Card(
            elevation: 1,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Access Bank PLC"),
            ),
          ),
          const Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Mic************anna"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _launchUrl();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: mine,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text("See List of Donors"),
              ),
              ElevatedButton(
                onPressed: () {
                  _sendingMails();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: mine,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text("Email Us Reciept"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
