import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:bazei_taxi_app/screens/splash_sreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bazei Taxi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeColor.primary),
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}