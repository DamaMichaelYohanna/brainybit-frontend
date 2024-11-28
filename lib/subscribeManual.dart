import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscribeManualPage extends StatefulWidget {
  const SubscribeManualPage({super.key});

  @override
  State<SubscribeManualPage> createState() => _SubscribeManualPageState();
}

class _SubscribeManualPageState extends State<SubscribeManualPage> {
  // function to copy account number to clipboard
  void copyAccountNumber(String acc) {
    Clipboard.setData(ClipboardData(text: acc));
  }

  //  function to send mail
  openWhatsapp() async {
    String contact = "+2348160535033";
    String text = 'Hello here is my evidence of payment';
    String androidUrl = "whatsapp://send?phone=$contact&text=$text";
    await launchUrl(Uri.parse(androidUrl));
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
              height: 300,
              width: 300,
              child: Image.asset("assets/images/dollar.png")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Text(
              "For manual purchase of token, transfer the sum of 1000 naira only to the below account and send us the evidence of payment via whatsapp. We will provide you with token ASAP after confirmation",
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                openWhatsapp();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: mine,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              child: const Text("Send Payment Evidence(Whatsapp)"),
            ),
          ),
        ],
      ),
    );
  }
}
