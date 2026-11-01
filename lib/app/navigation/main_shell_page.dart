import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../shared/widgets/coming_soon_view.dart';
import 'main_shell_controller.dart';
import 'widgets/main_bottom_navigation_bar.dart';

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
    return Obx(() {
      final currentIndex = controller.currentIndex.value;

      return Scaffold(
        body: IndexedStack(index: currentIndex, children: _tabs),
        bottomNavigationBar: MainBottomNavigationBar(
          currentIndex: currentIndex,
          onDestinationSelected: controller.changeTab,
        ),
      );
    });
  }
}
