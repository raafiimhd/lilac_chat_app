import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:lilac_chat_app/model/base_url/base_url.dart';
import 'package:lilac_chat_app/model/chat_model/chat_model.dart';

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;

  final Dio _dio = Dio();

Future<void> fetchMessages(int senderId, int receiverId) async {
  try {
    final response = await _dio.get(
      '$baseUrl/chat/chat-messages/queries/chat-between-users/$senderId/$receiverId',
    );
    if (response.statusCode == 200) {
      final data = response.data['data'] as List;
      messages.value = data.map((json) => ChatMessage.fromJson(json)).toList();
    }
  } catch (e) {
    print('Error fetching messages: $e');
  }
}


}
