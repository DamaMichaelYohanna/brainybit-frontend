import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<List<String>> chat = [];
  final TextEditingController chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Future<void> fetchResponse(String prompt) async {
    const String baseUrl = 'https://locator-xi.vercel.app/chat';

    final Map<String, String> queryParams = {
      'prompt': prompt,
    };
    final Uri uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
    try {
      // final response = await http.get(Uri.https("dummyjson.com", "products/1"));
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // Request successful, handle response data
        debugPrint('Response body: ${response.body}');
        final body = json.decode(response.body);
        setState(() {
          chat.add(["ai", body["message"]]);
        });
      } else {
        // Request failed
        debugPrint('Request failed with status: ${response.statusCode}');
        setState(() {
          chat.add(["ai", "Sorry! An error occured"]);
        });
      }
    } catch (e) {
      // An error occurred
      setState(() {
        chat.add(["ai", "Sorry! An error occured"]);
      });
    }
  }

  void sendMessage() {
    String message = chatController.text;
    chatController.text = "";
    if (message.isNotEmpty) {
      setState(() {
        chat.add(["user", message]);
      });
      fetchResponse(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration aiChat = const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ));
    BoxDecoration userChat = const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);
      }
    });
    return Scaffold(
      body: ListView.builder(
          itemCount: chat.length,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              alignment: chat[index][0] == "user"
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                elevation: 0,
                margin: chat[index][0] == "user"
                    ? EdgeInsets.only(left: 45, right: 10, top: 10, bottom: 10)
                    : EdgeInsets.only(left: 10, right: 45, top: 10, bottom: 10),
                color: chat[index][0] == "user"
                    ? Color.fromARGB(255, 234, 232, 228)
                    : Color.fromARGB(255, 235, 230, 216),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "${chat[index][1]}",
                    style: const TextStyle(),
                    // textAlign: true == true ? TextAlign.right : TextAlign.left,
                  ),
                ),
              ),
            );
          }),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: chatController,
              decoration: InputDecoration(
                hintText: "Enter Your Prompt",
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send_rounded,
                  ),
                  onPressed: () {
                    sendMessage();
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          )),
    );
  }
}
