import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the full timezone database once.
  tzdata.initializeTimeZones();

  runApp(const AmarIslamApp());
}
