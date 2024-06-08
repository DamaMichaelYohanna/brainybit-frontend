import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/drawer_pages/donors.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscribeManualPage extends StatefulWidget {
  const SubscribeManualPage({super.key});

  @override
  State<SubscribeManualPage> createState() => _SubscribeManualPageState();
}

class _SubscribeManualPageState extends State<SubscribeManualPage> {
  final Uri _url = Uri.parse('https://locator-xi.vercel.app/register');
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
      path: 'get2dama11@gmail.com',
    );

    await launchUrl(url);
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manuel Purchase"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 12),
              height: 80,
              width: 30,
              child: Image.asset("assets/images/dollar.png")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Text(
              "For manual purchase of token, transfer the sum of 500 naira only to the below account and send us the evidence of payment via whatsapp. We will provide you with token ASAP after confirmation",
              style: TextStyle(fontSize: 16, color: mine.shade900),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          //   child: Text(
          //     "This also means that you will"
          //     " continue to enjoy ads free services.",
          //     style: TextStyle(fontSize: 16, color: mine.shade900),
          //   ),
          // ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: mine,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              child: const Text("Send via Whatsapp"),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     _sendingMails();
          //   },
          //   style: ElevatedButton.styleFrom(
          //       backgroundColor: mine,
          //       foregroundColor: Colors.white,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(5))),
          //   child: const Text("Email Us Reciept"),
          // ),
        ],
      ),
    );
  }
}
