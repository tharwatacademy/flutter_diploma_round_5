import 'package:chat_app_with_ai/models/message_model.dart';
import 'package:chat_app_with_ai/services/api_service.dart';
import 'package:dio/dio.dart';

class ChatService {
  Future<MessageModel> sendMessage({
    required List<MessageModel> messages,
  }) async {
    try {
      var response = await ApiService().post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent",
        data: {
          // List<MessageModel>
          "contents": messages
              .map((message) => message.toJson())
              .toList(), // List<Map>
        },
        headers: {
          "Content-Type": "application/json",
          "x-goog-api-key": "AIzaSyAR3vDycPVyqQEqhCQRQIfSe8wadPg5S8U",
        },
      );

      var messageModel = MessageModel.fromJson(
        response.data['candidates'][0][""],
      );
      return messageModel;
    } on DioException catch (e) {
      throw ServerException(
        errMessage:
            e.response?.data['error']['message'] ?? "Something went wrong",
      );
    } catch (e) {
      throw ServerException(errMessage: 'Something went wrong');
    }
  }
}

class ServerException implements Exception {
  final String errMessage;

  ServerException({required this.errMessage});
}
