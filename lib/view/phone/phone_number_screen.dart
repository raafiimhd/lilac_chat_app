import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lilac_chat_app/controller/auth_controller.dart';
import 'package:lilac_chat_app/view/otp/otp_screen.dart';

class PhoneNumberScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _phoneController = TextEditingController();
  String completePhoneNumber = '';
  PhoneNumberScreen({super.key});
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
            Text(
              'Enter your phone number',
              style: TextStyle(
                fontSize: 22.rt,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.rh),
            IntlPhoneField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.rs),
                  borderSide: const BorderSide(),
                ),
                prefixIcon: const Icon(Icons.phone),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                completePhoneNumber =
                    phone.completeNumber; // Includes country code
              },
            ),
            SizedBox(height: 8.rh),
            Text(
              'Fliq will send you a text with a verification code.',
              style: TextStyle(
                fontSize: 14.rt,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            Obx(() {
              return SizedBox(
                width: double.infinity,
                height: 48.rh,
                child: ElevatedButton(
                  onPressed: _authController.isLoading.value
                      ? null
                      : () async {
                          if (completePhoneNumber.isNotEmpty) {
                            bool success = await _authController
                                .sendOtp(completePhoneNumber);
                            if (success) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => OTPVerificationScreen(phoneNumber: completePhoneNumber,),
                                ),
                              );
                            }
                          } else {
                            Get.snackbar(
                                'Error', 'Please enter a phone number');
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: _authController.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.rt,
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
