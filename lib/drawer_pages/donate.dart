import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konnet/colorScheme.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  // function to copy account number to clipboard
  void copyAccountNumber(String acc) {
    Clipboard.setData(ClipboardData(text: "$acc"));
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
              ))
        ],
      ),
    );
  }
}
