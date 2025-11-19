import 'package:flutter/material.dart';
import 'screens/account_settings.dart';
import 'package:jurnalku_mobile/screens/general/usage_guide_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const UsageGuidePage(),
    );
  }
}
