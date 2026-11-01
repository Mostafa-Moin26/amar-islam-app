import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/navigation/main_shell_page.dart';
import '../../../../app/theme/app_colors.dart';
import '../widgets/welcome_content.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final PageController _pageController;

  bool _isAnimating = false;
  bool _hasCompletedWelcome = false;

  static const Duration _animationDuration = Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _goToNextPage() async {
    if (_isAnimating || _hasCompletedWelcome || !_pageController.hasClients) {
      return;
    }

    _isAnimating = true;

    try {
      await _pageController.animateToPage(
        1,
        duration: _animationDuration,
        curve: Curves.easeInOutCubic,
      );
    } finally {
      _isAnimating = false;
    }
  }

  bool _handleScrollEnd(ScrollEndNotification notification) {
    if (notification.depth != 0 ||
        _hasCompletedWelcome ||
        !_pageController.hasClients) {
      return false;
    }

    final currentPage = _pageController.page ?? 0;

    if (currentPage >= 0.99 && mounted) {
      setState(() {
        _hasCompletedWelcome = true;
      });
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final systemUiOverlayStyle = _hasCompletedWelcome
        ? SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: AppColors.warmCream,
            systemNavigationBarIconBrightness: Brightness.dark,
          )
        : SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: AppColors.splashBackground,
            systemNavigationBarIconBrightness: Brightness.light,
          );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const MainShellPage(),

          if (!_hasCompletedWelcome)
            NotificationListener<ScrollEndNotification>(
              onNotification: _handleScrollEnd,
              child: PageView(
                controller: _pageController,
                children: [
                  WelcomeContent(onNext: _goToNextPage),
                  const SizedBox.expand(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
