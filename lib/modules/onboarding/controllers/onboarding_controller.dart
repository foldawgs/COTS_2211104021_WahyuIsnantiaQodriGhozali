import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final List<String> images = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];

  final List<Map<String, String>> contents = [
    {
      'title': 'Selamat datang di gojek!',
      'description':
          'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun',
    },
    {
      'title': 'Transportasi & logistik',
      'description':
          'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~',
    },
    {
      'title': 'Pesan makan & belanja',
      'description': 'Lagi ngidam sesuatu? Gojek beliin gak pakai lama.',
    },
  ];

  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
