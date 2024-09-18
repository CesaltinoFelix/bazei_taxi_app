import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:bazei_taxi_app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Pacote para o campo de telefone internacional

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo centralizado
              Image.asset(
                "assets/images/logo.png",
                width: context.width * 0.30,
              ),
              const SizedBox(height: 80), // Espaço maior entre o logo e o restante dos elementos
              // Campo de telefone com seleção de país
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'US', // Código do país inicial
                onChanged: (phone) {
                  // Lógica para pegar o telefone com o código do país
                  print(phone.completeNumber);
                },
              ),
              const SizedBox(height: 25),
              // Botões de login com Google, Facebook e Email
              _buildSocialButton("assets/images/logos_google-icon.png", "Sign up with Google", () {
                // Lógica para login com Google
              }),
              const SizedBox(height: 25),
              _buildSocialButton("assets/images/logos_facebook.png", "Sign up with Facebook", () {
                // Lógica para login com Facebook
              }),
              const SizedBox(height: 25),
              _buildSocialButton("assets/images/logos_google-gmail.png", "Sign up with Email", () {
                // Lógica para registro com Email
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
              // Botão de Sign Up
              RoundButton(
                title: "SIGN UP",
                onPressed: () {
                  // Lógica para criar a conta
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: ThemeColor.secondaryText,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Lógica para redirecionar para a tela de login
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: ThemeColor.accentText,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
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
