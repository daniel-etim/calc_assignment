import 'package:flutter/material.dart';
import 'screens/dashboard_calc.dart';

void main() => runApp(const QuickMathApp());

class QuickMathApp extends StatelessWidget {
  const QuickMathApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'QuickMath',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E), brightness: Brightness.dark),
      useMaterial3: true,
    ),
    home: const QuickMathScreen(),
  );
}
