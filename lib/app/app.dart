import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

class AmarIslamApp extends StatelessWidget {
  const AmarIslamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'আমার ইসলাম',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,

      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('আমার ইসলাম'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {},
                child: const Text('Testing Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
