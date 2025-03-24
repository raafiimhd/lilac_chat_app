import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lilac_chat_app/model/base_url/base_url.dart';
import 'package:lilac_chat_app/model/sent_otp_model/sent_otp_model.dart';
import 'package:lilac_chat_app/model/sent_otp_model/verify_otp_model.dart';
import 'package:lilac_chat_app/view/message/messages_screen.dart';

class AuthController extends GetxController {
  final Dio _dio = Dio();

  // Loading State
  var isLoading = false.obs;

  // Function to send OTP
  Future<bool> sendOtp(String phoneNumber) async {
    isLoading.value = true;
    try {
      const url = '$baseUrl/auth/registration-otp-codes/actions/phone/send-otp';
      final response = await _dio.post(
        url,
        data: SendOtpRequest(
          data: Datasss(
            attributes: Attributes(phone: phoneNumber),
          ),
        ),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data is Map && response.data['status'] == true) {
          final message = response.data['message'] ?? 'OTP sent successfully';
          if (Get.context != null) {
            Get.snackbar('Success', message);
          }
          return true;
        } else {
          final error = response.data['message'] ?? 'Failed to send OTP';
          if (Get.context != null) {
            Get.snackbar('Error', error);
          }
        }
      } else if (response.statusCode == 302) {
        final redirectUrl = response.headers['location']?.first;
        if (Get.context != null) {
          Get.snackbar('Redirect', 'Redirecting to $redirectUrl');
        }
      } else {
        if (Get.context != null) {
          Get.snackbar('Error', 'Unexpected response from server');
        }
      }
    } on DioException catch (e) {
      if (e.response?.data is Map) {
        final errorMessage = e.response?.data['message']?.toString();
        if (Get.context != null) {
          Get.snackbar('Error', errorMessage ?? 'Failed to send OTP');
        }
      } else if (e.response?.data is String &&
          e.response!.data.contains('<html>')) {
        if (Get.context != null) {
          Get.snackbar(
              'Error', 'Invalid server response. Please try again later.');
        }
      } else {
        if (Get.context != null) {
          Get.snackbar('Error', 'Failed to send OTP');
        }
      }
    } finally {
      isLoading.value = false;
    }

    return false;
  }

  Future<bool> verifyOtp(String phone, int otp) async {
    isLoading.value = true;
    try {
      const url =
          '$baseUrl/auth/registration-otp-codes/actions/phone/verify-otp';

      final deviceMeta = DeviceMeta(
        type: 'web',
        name: 'HP Pavilion 14-EP0068TU',
        os: 'Linux x86_64',
        browser: 'Mozilla Firefox Snap for Ubuntu (64-bit)',
        browserVersion: '112.0.2',
        userAgent:
            'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0',
        screenResolution: '1600x900',
        language: 'en-GB',
      );

      final request = VerifyOtpRequest(
        data: Datas(
          type: 'registration_otp_codes',
          attributes: Attribute(
            phone: phone,
            otp: otp,
            deviceMeta: deviceMeta,
          ),
        ),
      );

      final response = await _dio.post(
        url,
        data: request.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final accessToken =
            data['data']?['attributes']?['auth_status']?['access_token'];

        if (accessToken != null) {
          final storage = GetStorage();
          storage.write('token', accessToken);
          if (Get.context != null) {
            Get.snackbar('Success', 'OTP Verified Successfully');
          }

          return true;
        } else {
          if (Get.context != null) {
            Get.snackbar('Error', 'Invalid access token');
          }
        }
      } else {
        if (Get.context != null) {
          Get.snackbar('Error', 'OTP Verification Failed');
        }
      }
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['message'] ?? 'Failed to verify OTP';

      if (Get.context != null) {
        Get.snackbar('Error', errorMessage);
      }
    } finally {
      isLoading.value = false;
    }

    return false;
  }

}
