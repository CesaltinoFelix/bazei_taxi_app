import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:bazei_taxi_app/screens/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0x3B3939),
      statusBarBrightness: Brightness.light
    ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bazei Taxi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ThemeColor.primary,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent
        ),
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
