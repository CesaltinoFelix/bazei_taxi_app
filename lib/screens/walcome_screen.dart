import 'package:bazei_taxi_app/screens/change_language_screen.dart';
import 'package:bazei_taxi_app/widgets/round_button.dart';
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
               
                SizedBox(height: context.height * 0.4,),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        Image.asset("assets/images/logo1.png", 
                        width: context.width * 0.6,
                        height: context.height * 0.05,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "The best way to get around the city, with safety, speed, and comfort.\nYour city, your rules. Travel your way.",
                          style: TextStyle(
                            color: ThemeColor.primaryTextWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: context.height * 0.20),
                        RoundButton(
                          title: "Let's go!", 
                          onPressed: (){
                              Get.to(()=> const ChangeLanguageScreen(), transition: Transition.rightToLeft, duration: const Duration(seconds: 1));
                          }),
                        
                        SizedBox(height: context.height * 0.04),
                        
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            //padding: const EdgeInsets.symmetric(vertical: 0,),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: ThemeColor.primaryTextWhite, width: 2 
                                ),
                                
                              )
                            ),
                            child: Text(
                              "Drive with Bazei", 
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: ThemeColor.primaryTextWhite)
                              ),
                          )
                          )            
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
