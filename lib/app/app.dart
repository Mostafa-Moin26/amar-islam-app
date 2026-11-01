import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

class AmarIslamApp extends StatelessWidget {
  const AmarIslamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'আমার ইসলাম',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.welcome,
      getPages: AppPages.pages,
    );
  }
}
