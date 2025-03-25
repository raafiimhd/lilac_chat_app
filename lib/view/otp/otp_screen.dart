import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_chat_app/controller/auth_controller.dart';
import 'package:lilac_chat_app/view/message/messages_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController otpController = TextEditingController();
  final String phoneNumber;

  OTPVerificationScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24.rh),
            const Text(
              'Enter your verification code',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.rh),
            Text(
              phoneNumber,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.rt,
              ),
            ),
            SizedBox(height: 24.rh),
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: otpController,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 40,
                activeColor: Colors.pink,
                selectedColor: Colors.pink,
                inactiveColor: Colors.grey,
              ),
              onChanged: (value) {
                otpController.text = value;
                otpController.selection = TextSelection.fromPosition(
                  TextPosition(offset: otpController.text.length),
                );
              },
            ),
            SizedBox(height: 24.rh),
            Obx(() {
              return SizedBox(
                width: double.infinity,
                height: 48.rh,
                child: ElevatedButton(
                  onPressed: authController.isLoading.value
                      ? null
                      : () async {
                          if (otpController.text.length == 6) {
                            bool success = await authController.verifyOtp(
                              phoneNumber,
                              int.parse(otpController.text),
                            );
                            if (success) {
                              var responseId = authController.user.first.id;
                              // ✅ Navigate to MessagesScreen after success
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MessagesScreen(
                                  id: responseId,
                                ),
                              ));
                            }
                          } else {
                            Get.snackbar('Error', 'Please enter a valid OTP');
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: authController.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Verify',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                ),
              );
            }),
            SizedBox(height: 24.rh),
          ],
        ),
      ),
    );
  }
}
