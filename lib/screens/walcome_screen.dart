import 'package:bazei_taxi_app/screens/change_language_screen.dart';
import 'package:flutter/material.dart';
import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:get/get.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

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
    Get.to(()=> const ChangeLanguageScreen(), transition: Transition.zoom, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/bg-yellow-car-city-map.png",
            width: context.width,
            height: context.height,
            fit: BoxFit.cover,
          ),
          
          // Container(
          //   width: double.infinity, 
          //   height: double.infinity,
          //   // color: Colors.black54, //adicionando opacidade
          // ),

          SafeArea(
            child: Column(
              children: [
               
                const Spacer(),
                Align(
                  alignment: Alignment.bottomLeft, // Alinha o texto ao canto inferior esquerdo
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Bem-vindo!",
                          style: TextStyle(
                            color: ThemeColor.primaryTextWhite,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Image.asset("assets/images/logo1.png", 
                        width: context.width * 0.8,
                        height: context.height * 0.07,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "O jeito mais fácil de viajar pela cidade.",
                          style: TextStyle(
                            color: ThemeColor.primaryTextWhite,
                            fontSize: 16,
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
