import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:http/http.dart' as http;

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  // Form fields
  String expOption = '';
  String sugOption = '';
  final TextEditingController submissionControl = TextEditingController();
  bool isSubmitting = false; // State for showing the loading indicator

  Future<void> submitFeedback() async {
    final experience = expOption;
    final submission = submissionControl.text.trim();
    final category = sugOption;

    if (experience.isEmpty || submission.isEmpty || category.isEmpty) {
      _showDialog("Error!", "All fields are required.");
      return;
    }

    var url =
        Uri.https('brainybit.vercel.app', 'api/v1/general/feedback/upload');
    final Map<String, String> formData = {
      'experience': experience,
      "submission": submission,
      "category": category,
    };

    setState(() {
      isSubmitting = true; // Show loading indicator
    });

    try {
      final response = await http.post(url, body: formData);

      if (response.statusCode == 200) {
        // Clear inputs on success
        submissionControl.clear();
        setState(() {
          expOption = '';
          sugOption = '';
        });
        _showDialog(
            "Success!", "Your feedback has been submitted successfully.");
      } else {
        _showDialog("Error!", "Feedback not submitted. Please try again.");
      }
    } catch (e) {
      _showDialog("Error!", "Check your internet connection and try again.");
    } finally {
      setState(() {
        isSubmitting = false; // Hide loading indicator
      });
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping outside of the input field
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Suggestions"),
          backgroundColor: mine,
          foregroundColor: mine,
          elevation: 0,
        ),
        body: ListView(
          children: [
            // Header
            Container(
              height: 150,
              color: mine,
              padding: const EdgeInsets.all(12),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's hear from you.",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Do you have suggestions, or did you find any bugs with our application? Let us know below.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            // Experience question
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "How was your experience?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: ["good", "fair", "bad"].map((option) {
                return Expanded(
                  child: Column(
                    children: [
                      Radio(
                        value: option,
                        groupValue: expOption,
                        onChanged: (value) {
                          setState(() {
                            expOption = value.toString();
                          });
                        },
                      ),
                      Text(option[0].toUpperCase() + option.substring(1)),
                    ],
                  ),
                );
              }).toList(),
            ),

            // Submission text field
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: submissionControl,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 236, 240, 244),
                  hintText: "Tell us your experience or suggestions",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                maxLines: 7,
              ),
            ),

            // Suggestion category
            Row(
              children: ["bug", "suggestion", "others"].map((option) {
                return Expanded(
                  child: Column(
                    children: [
                      Radio(
                        value: option,
                        groupValue: sugOption,
                        onChanged: (value) {
                          setState(() {
                            sugOption = value.toString();
                          });
                        },
                      ),
                      Text(option[0].toUpperCase() + option.substring(1)),
                    ],
                  ),
                );
              }).toList(),
            ),

            // Submit button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mine,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: isSubmitting ? null : submitFeedback,
                child: isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : const Text(
                        "Submit Feedback",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
