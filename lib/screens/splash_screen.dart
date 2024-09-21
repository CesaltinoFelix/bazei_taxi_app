import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bazei_taxi_app/screens/walcome_screen.dart';
import 'package:bazei_taxi_app/common/color_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()
  {
    super.initState();
    load();
  }

  void load() async{
    await Future.delayed(const Duration(seconds: 3));
    loadNextPage();
  }

  void loadNextPage()
  {
    Get.to(()=> const WelcomeScreen(), transition: Transition.rightToLeft, duration: const Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Removendo o padding das áreas seguras como status bar
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: Container(
              width: double.infinity, 
              height: double.infinity, 
              color: ThemeColor.primary,
            ),
          ),

          Image.asset(
            "assets/images/logo.png",
            width: context.width * 0.30, 
          )
        ],
      ),
    );
  }
}
