import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/image_carousel.dart';
import '../controllers/onboarding_controller.dart';
import '../bindings/onboarding_binding.dart';
import 'package:cots_wahyuisnantiaqodrighozali/design_system/colorCollections.dart';
import 'package:cots_wahyuisnantiaqodrighozali/modules/login/views/login_page.dart';
import 'package:cots_wahyuisnantiaqodrighozali/modules/login/controllers/login_controller.dart'; // Import LoginController

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inject OnboardingController and LoginController here
    Get.put(OnboardingBinding());
    
    final OnboardingController controller = Get.find();

    final buttonWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageCarousel(),
              SizedBox(height: 20),
              Obx(
                () => Text(
                  controller.contents[controller.currentIndex.value]['title']!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Obx(
                  () => Text(
                    controller.contents[controller.currentIndex.value]['description']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF727272),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Tombol Masuk
              Container(
                width: buttonWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    // Inject LoginController before navigating to LoginPage
                    Get.put(LoginController());
                    Get.to(() => LoginPage());
                  },
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Tombol Daftar
              Container(
                width: buttonWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color: AppColors.green, // Warna outline
                        width: 2, // Ketebalan outline
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Handle sign up action
                  },
                  child: Text(
                    'Belum ada akun?, Daftar dulu',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Dengan masuk atau mendaftar, kamu menyetujui Ketentuan layanan dan Kebijakan privasi.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF727272),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Image.asset(
              'assets/images/logo.png', // Path logo Anda
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
