import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:bazei_taxi_app/screens/home_screen.dart';
import 'package:bazei_taxi_app/screens/sign_up_screen.dart';
import 'package:bazei_taxi_app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(), // Espaço para centralizar o logo
              // Logo centralizado
              Image.asset(
                "assets/images/logo.png",
                width: context.width * 0.30,
              ),
              const SizedBox(height: 100), // Maior espaço entre o logo e os botões
              // Botões de login com Google, Facebook e Email
              _buildSocialButton("assets/images/logos_google-icon.png", "Login with Google", () {
                // Lógica para login com Google
              }),
              const SizedBox(height: 25),
              _buildSocialButton("assets/images/logos_facebook.png", "Login with Facebook", () {
                // Lógica para login com Facebook
              }),
              const SizedBox(height: 25),
              _buildSocialButton("assets/images/logos_google-gmail.png", "Login with Email", () {
                // Lógica para login com Email
              }),
              const SizedBox(height: 50),
              // Divisor com "ou"
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: ThemeColor.primaryTextWhite,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Botão de Login
              RoundButton(
                title: "SIGN IN",
                onPressed: () {
                 Get.to(()=> const HomeScreen(), transition: Transition.fade, duration: const Duration(seconds: 1));
                },
              ),

              const SizedBox(height: 10),
              
              TextButton(
                onPressed: () {
                 Get.to(()=> const SignUpScreen(), transition: Transition.fade, duration: const Duration(seconds: 1));
                },
                child: Text(
                "SIGN UP",
                style: TextStyle(
                  color: ThemeColor.primaryTextWhite,
                  fontSize: 16,
                ),
              ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: ThemeColor.secondaryText,
                    fontSize: 14,
                  ),
                ),
                  TextButton(
                onPressed: () {
                  // Lógica para redirecionar à tela de redefinição de senha
                },
                child: Text(
                  "Change password",
                  style: TextStyle(
                    color: ThemeColor.accentText,
                    fontSize: 14,
                  ),
                ),
              ),
                ],
              ),
              const Spacer(), // Espaço final para melhor centralização
            ],
          ),
        ),
      ),
    );
  }

  // Função para construir os botões de login social
  Widget _buildSocialButton(String iconPath, String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          iconPath,
          width: 20,
          height: 20,
        ),
        label: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white), // Borda branca
          padding: const EdgeInsets.symmetric(vertical: 14), // Aumentando o espaçamento interno
          backgroundColor: Colors.transparent, // Fundo transparente
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
