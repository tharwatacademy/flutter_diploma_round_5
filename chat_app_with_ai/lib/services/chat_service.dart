import 'package:chat_app_with_ai/models/message_model.dart';
import 'package:chat_app_with_ai/services/api_service.dart';

class ChatService {
  Future<MessageModel> sendMessage({
    required List<MessageModel> messages,
  }) async {
    var response = await ApiService().post(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent",
      data: {"contents": messages.map((message) => message.toJson()).toList()},
      headers: {
        "Content-Type": "application/json",
        "x-goog-api-key": "AIzaSyAK4b6idsZ1Sk9m6276eKhTAyGfb80QTlM",
      },
    );

    var messageModel = MessageModel.fromJson(
      response.data['candidates'][0]["content"],
    );
    return messageModel;
  }
}
