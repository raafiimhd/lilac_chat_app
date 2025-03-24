import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:lilac_chat_app/view/phone/phone_number_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/image (1).png', // Add your background image to the assets folder
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4), // Add a dark overlay to enhance readability
          ),
          Padding(
            padding:  EdgeInsets.only(top: 100.rt),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Logo
                 CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.rs,
                  child: Icon(
                    Icons.favorite, // Change to your desired icon or image
                    color: Colors.pink,
                    size: 30.rt,
                  ),
                ),
                 SizedBox(height: 20.rh),

                // Heading Text
                 Text(
                  'Connect. Meet. Love.\nWith Fliq Dating',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.rt,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 250.rh),

                // Sign in with Google Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize:  Size(double.infinity, 50.rt),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons8-google-48.png', // Add Google logo to assets
                    height: 24,
                    width: 24,
                  ),
                  label: const Text(
                    'Sign in with Google',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                 SizedBox(height: 12.rh),

                // Sign in with Facebook Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                   
                  },
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Sign in with Facebook',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),

                // Sign in with Phone Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) =>  PhoneNumberScreen()),
);
                  },
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Sign in with phone number',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                 SizedBox(height: 20.rh),

                // Terms and Privacy Policy
                const Text.rich(
                  TextSpan(
                    text: 'By signing up, you agree to our ',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    children: [
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '. See how we use your data in our ',
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}