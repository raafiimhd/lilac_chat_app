import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lilac_chat_app/model/base_url/base_url.dart';
import 'package:lilac_chat_app/model/message_model/message_model.dart';

class MessagesController extends GetxController {
  final Dio _dio = Dio();
  final box = GetStorage();

  // Observable list for storing user data
  var contacts = <MessageModel>[].obs;


  @override
  void onInit() {
    fetchContacts();
    super.onInit();
  }

 Future<void> fetchContacts() async {
  try {
    String? token = box.read('token'); 
    if (token == null) {
      return;
    }

    _dio.options.headers['Authorization'] = 'Bearer $token';

    final response = await _dio.get('$baseUrl/chat/chat-messages/queries/contact-users');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      
      contacts.value = data.map((json) {
        return MessageModel.fromJson({
          'id': json['id'], 
          'name': json['attributes']['name'],
          'email': json['attributes']['email'],
          'phone': json['attributes']['phone'],
          'gender': json['attributes']['gender'],
          'address': json['attributes']['city_name'] ?? '',
          'profile_photo_url': json['attributes']['profile_photo_url'] ?? '',
          'age': json['attributes']['age'] ?? 0,
          'bio_intro_text': json['attributes']['bio_intro_text'] ?? '',
          'is_online': json['attributes']['is_online'] ?? false, // Include is_online
        });
      }).toList();
    }
  } catch (e) {
  }
}

}
