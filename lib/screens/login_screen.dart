import 'package:bazei_taxi_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
           Container(
            width: double.infinity, 
            height: double.infinity,
            // color: Colors.black54, //adicionando opacidade
          ),
          SafeArea(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: context.width * 0.30,
                  // height: context.height * 0.30,
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}