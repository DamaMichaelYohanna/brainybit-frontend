import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:brainybit/colorScheme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<List<String>> chat = [];
  final TextEditingController chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isTyping = false; // State to track if AI is typing

  Future<void> fetchResponse(String prompt) async {
    const String baseUrl = 'https://brainybit.vercel.app/chat';

    final Map<String, String> queryParams = {
      'prompt': prompt,
    };
    final Uri uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);

    try {
      setState(() {
        isTyping = true; // Show typing indicator
        chat.add(["ai", "typing..."]);
      });

      final response = await http.get(uri);

      setState(() {
        // Remove "typing..." message
        chat.removeWhere(
            (message) => message[0] == "ai" && message[1] == "typing...");
        isTyping = false;
      });

      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        setState(() {
          chat.add(["ai", body["message"]]);
        });
      } else {
        setState(() {
          chat.add(["ai", "Sorry! An error occurred."]);
        });
      }
    } catch (e) {
      setState(() {
        chat.removeWhere(
            (message) => message[0] == "ai" && message[1] == "typing...");
        chat.add(["ai", "Sorry! An error occurred."]);
        isTyping = false;
      });
    }
  }

  void sendMessage() {
    String message = chatController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        chat.add(["user", message]);
      });
      chatController.clear();
      fetchResponse(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        );
      }
    });

    return Scaffold(
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView.builder(
              itemCount: chat.length,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                final isUser = chat[index][0] == "user";
                return Row(
                  mainAxisAlignment:
                      isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!isUser)
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/bot.png'),
                        // Replace with your AI profile image
                        backgroundColor: Colors.grey[200],
                      ),
                    // if (!isUser) const SizedBox(width: 5),
                    Flexible(
                      child: Card(
                        elevation: 0,
                        margin: isUser
                            ? const EdgeInsets.only(
                                left: 45, right: 10, top: 10, bottom: 10)
                            : const EdgeInsets.only(
                                left: 10, right: 45, top: 10, bottom: 10),
                        color: isUser
                            ? const Color.fromARGB(255, 221, 229, 237)
                            : mine.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            chat[index][1],
                            style: const TextStyle(),
                          ),
                        ),
                      ),
                    ),
                    if (isUser)
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        // Replace with your user profile image
                        backgroundColor: Colors.grey[200],
                      ),
                  ],
                );
              },
            ),
          ),
          // Input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Expanded Text Field
                Expanded(
                  child: TextFormField(
                    controller: chatController,
                    autofocus: false,
                    minLines: 1,
                    maxLines: 5, // Limit the max height to 5 lines
                    decoration: InputDecoration(
                      hintText: "Enter your message...",
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send_rounded, color: mine),
                        onPressed: sendMessage,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
