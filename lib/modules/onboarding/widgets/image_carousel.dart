import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();

    return CarouselSlider(
      items: controller.images
          .map(
            (image) => Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 250,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) {
          controller.changeIndex(index);
        },
      ),
    );
  }
}
