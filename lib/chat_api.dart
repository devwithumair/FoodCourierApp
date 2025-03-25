import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatController extends GetxController {
  var messages = <Map<String, dynamic>>[].obs;
  var isTyping = false.obs;

  final String apiKey =
      "AIzaSyACfzr2xy5ss929EC9XIX9w60r1d-Miwuw"; // Replace with your valid API key
  final String apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";

  /// Function to send a user message and get a bot response
  void sendMessage(String userMessage) async {
    messages.add({'text': userMessage, 'isUser': true});
    isTyping.value = true;

    final botResponse = await getGeminiResponse(userMessage);
    messages.add({'text': botResponse, 'isUser': false});

    isTyping.value = false;
  }

  /// Function to fetch Gemini AI response
  Future<String> getGeminiResponse(String inputText) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl?key=$apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": inputText},
              ],
            },
          ],
        }),
      );

      print("API Response: ${response.body}"); // Debugging output

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data.containsKey('candidates') && data['candidates'].isNotEmpty) {
          final candidate = data['candidates'][0];

          if (candidate.containsKey('content') &&
              candidate['content'].containsKey('parts') &&
              candidate['content']['parts'].isNotEmpty) {
            return candidate['content']['parts'][0]['text'] ?? "No response";
          }
        }
        return "No valid response received";
      } else {
        return "Error: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
