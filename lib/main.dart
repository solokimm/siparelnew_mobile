import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'detail_report.dart';
import 'gallery.dart';
import 'notifications.dart';
import 'activation.dart';
import 'profile_settings.dart';
import 'choose_map.dart';
import 'add_report.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF000670);
    final primarySwatch = MaterialColor(primaryColor.value, const {
      50: Color(0xFFE3E8FC),
      100: Color(0xFFB8C1F8),
      200: Color(0xFF8A9AF4),
      300: Color(0xFF5C73F0),
      400: Color(0xFF3A56EC),
      500: Color(0xFF182AE8),
      600: Color(0xFF1525E5),
      700: Color(0xFF101EE1),
      800: Color(0xFF0C18DD),
      900: Color(0xFF060DDD),
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIPARELNEW',
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: LoginPage(),
    );
  }
}
