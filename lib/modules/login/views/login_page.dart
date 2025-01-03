import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../bindings/login_binding.dart';
import 'package:cots_wahyuisnantiaqodrighozali/modules/login/widgets/phone_number_input.dart'; // Import the phone number input widget
import 'package:cots_wahyuisnantiaqodrighozali/modules/login/widgets/continue_button.dart'; // Import the continue button widget
// import 'package:cots_wahyuisnantiaqodrighozali/design_system/fontCollections.dart';
import 'package:cots_wahyuisnantiaqodrighozali/design_system/colorCollections.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inject the controller using GetX
    Get.put(LoginBinding());

    final LoginController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.white, // Set the background color (e.g., light gray)
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the shadow for a clean look
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // Navigate back to the previous page
          },
        ),
        actions: [
          // Optionally add other app bar actions here
        ],
      ),
      body: Column(
        children: [
          // Content below the app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
              children: [
                SizedBox(height: 20),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter your registered phone number to log in',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF727272),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Phone number',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF727272),
                  ),
                ),
                SizedBox(height: 20),
                // Field nomor HP
                PhoneNumberInput(
                  onChanged: (value) {
                    controller.phoneNumber.value = value;
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          // Continue button at the bottom
          Spacer(), // Pushes the Continue button to the bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ContinueButton(
              onPressed: () {
                // Handle continue action
              },
            ),
          ),
          SizedBox(height: 20), // Optional spacing
        ],
      ),
    );
  }
}
