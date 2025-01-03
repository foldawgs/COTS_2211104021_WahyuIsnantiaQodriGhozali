import 'package:flutter/material.dart';
import 'package:cots_wahyuisnantiaqodrighozali/design_system/colorCollections.dart';
import 'package:cots_wahyuisnantiaqodrighozali/design_system/fontCollections.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const SearchBar(),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GopayCard(),
            const ServiceGrid(),
            const XPProgressCard(),
            const NearbyRestaurants(),
            const PromotionsList(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Find services, food, or places',
          prefixIcon: const Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }
}

class GopayCard extends StatelessWidget {
  const GopayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0081A0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/gopaylogo.png', height: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Rp7.434',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                'Tap for history',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              PaymentOption(icon: Icons.add, label: 'Top Up'),
              PaymentOption(icon: Icons.payment, label: 'Pay'),
              PaymentOption(icon: Icons.explore, label: 'Explore'),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const PaymentOption({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF0081A0)),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = [
      {'icon': Icons.motorcycle, 'label': 'GoRide', 'color': Colors.green},
      {'icon': Icons.directions_car, 'label': 'GoCar', 'color': Colors.green},
      {'icon': Icons.restaurant, 'label': 'GoFood', 'color': Colors.red},
      {'icon': Icons.local_shipping, 'label': 'GoSend', 'color': Colors.green},
      {'icon': Icons.shopping_cart, 'label': 'GoMart', 'color': Colors.red},
      {'icon': Icons.phone_android, 'label': 'GoPulsa', 'color': Colors.red},
      {'icon': Icons.star, 'label': 'GoClub', 'color': Colors.purple},
      {'icon': Icons.more_horiz, 'label': 'More', 'color': Colors.grey},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return ServiceItem(
            icon: services[index]['icon'] as IconData,
            label: services[index]['label'] as String,
            color: services[index]['color'] as Color,
          );
        },
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const ServiceItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class XPProgressCard extends StatelessWidget {
  const XPProgressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('121 XP to your next treasure'),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Restos near me',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Icon(Icons.restaurant, size: 16, color: Colors.red),
            ],
          ),
          // Add restaurant list here
        ],
      ),
    );
  }
}

class PromotionsList extends StatelessWidget {
  const PromotionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PromotionCard(
          title: 'Cashback 20%',
          subtitle: 'Aktifkan & Sambungkan GoPay & GoPayLater di Tokopedia',
          isNew: true,
        ),
        PromotionCard(
          title: 'Sambungin akun ke Tokopedia, Banyakin untung',
          subtitle: 'Sambungin Akun ke Tokopedia, Banyakin Untung',
          isNew: false,
        ),
        PromotionCard(
          title: 'Promo Belanja Online 10.10',
          subtitle: 'Cashback hingga Rp100.000',
          isNew: false,
        ),
      ],
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isNew;

  const PromotionCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              height: 160,
              color: Colors.grey[200],
              // Add promotion image here
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isNew)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'BARU!',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promos'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
      ],
    );
  }
}