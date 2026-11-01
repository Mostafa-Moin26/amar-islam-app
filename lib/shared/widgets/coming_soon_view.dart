import 'package:flutter/material.dart';

/// যে ট্যাব বা স্ক্রিন এখনো বানানো হয়নি, তার জন্য সাময়িক দৃশ্য।
class ComingSoonView extends StatelessWidget {
  const ComingSoonView({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('শীঘ্রই আসছে', style: textTheme.titleMedium)),
    );
  }
}
