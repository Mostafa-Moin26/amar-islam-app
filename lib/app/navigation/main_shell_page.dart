import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../shared/widgets/coming_soon_view.dart';
import 'main_shell_controller.dart';

/// অ্যাপের মূল কাঠামো: নিচে নেভিগেশন, উপরে বর্তমান ট্যাবের পেজ।
class MainShellPage extends GetView<MainShellController> {
  const MainShellPage({super.key});

  static const List<Widget> _tabs = [
    HomeScreen(),
    ComingSoonView(title: 'কুরআন'),
    ComingSoonView(title: 'দোয়া'),
    ComingSoonView(title: 'হাদিস'),
    ComingSoonView(title: 'আরও'),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // IndexedStack ট্যাব বদলালেও আগের ট্যাবের অবস্থা (যেমন স্ক্রল) ধরে রাখে।
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: _tabs,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changeTab,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'হোম',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              selectedIcon: Icon(Icons.menu_book),
              label: 'কুরআন',
            ),
            NavigationDestination(
              icon: Icon(Icons.front_hand_outlined),
              selectedIcon: Icon(Icons.front_hand),
              label: 'দোয়া',
            ),
            NavigationDestination(
              icon: Icon(Icons.library_books_outlined),
              selectedIcon: Icon(Icons.library_books),
              label: 'হাদিস',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu),
              selectedIcon: Icon(Icons.menu_open),
              label: 'আরও',
            ),
          ],
        ),
      ),
    );
  }
}
