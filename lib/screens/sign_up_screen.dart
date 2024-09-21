import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:bazei_taxi_app/screens/otp_screen.dart';
import 'package:bazei_taxi_app/screens/sign_in_screen.dart';
import 'package:bazei_taxi_app/widgets/round_button.dart';
import 'package:bazei_taxi_app/widgets/round_button_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controladores para capturar os dados inseridos pelo usuário
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? completeNumber; 
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // Logo centralizado
              Image.asset(
                "assets/images/logo.png",
                width: context.width * 0.30,
              ),
              const SizedBox(height: 20),
              // Texto "Create new account"
              const Text(
                "Create new account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              // Campo Nome
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/images/mdi-light_account.png",), // Ícone de pessoa
                  labelText: "Name",
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.1)), // Borda branca com transparência
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.1)), // Borda branca com transparência
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: const TextStyle(color: Colors.white), // Texto branco
              ),
              
              const SizedBox(height: 20),
              
              // Campo Senha
              TextField(
                controller: _passwordController,
                obscureText: true, // Esconde o texto digitado
                decoration: InputDecoration(
                 prefixIcon: Image.asset("assets/images/codicon_eye.png",), // Ícone de cadeado
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.1)), // Borda branca com transparência
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.1)), // Borda branca com transparência
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: TextStyle(color: Colors.white), // Texto branco
              ),
              
              const SizedBox(height: 20),
              
              // Campo Confirmar Senha
              TextField(
                controller: _confirmPasswordController,
                obscureText: true, // Esconde o texto digitado
                decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/images/codicon_eye-closed.png"), // Ícone de cadeado
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.1)), // Borda branca com transparência
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.1)), // Borda branca com transparência
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: TextStyle(color: Colors.white), 
              ),
              
               const SizedBox(height: 20),
              IntlPhoneField(
                controller: _phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone, color: Colors.white), 
                  labelText: 'Contact Number',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.1)), 
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.1)), 
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                initialCountryCode: 'AO',
                onChanged: (phone) {
                  completeNumber = phone.completeNumber;
                },
                style: const TextStyle(color: Colors.white), 
                dropdownTextStyle: TextStyle(color: Colors.white), 
              ),
              
              const SizedBox(height: 40),

            isLoading ? 
            const RoundButtonCircularProgress()
            : 
            RoundButton(
              title: "CONTINUE",
              onPressed: () async {
                setState((){
                  isLoading = true;
                });
                String name = _nameController.text;
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;

                if (password == confirmPassword) {
                  Future.delayed(const Duration(seconds: 3), () {
                    setState((){
                    isLoading = false;
                    });
                    Get.to(
                      OTPScreen( name: name, number: completeNumber, password: password,), 
                      transition: Transition.rightToLeft, duration: const Duration(seconds: 1)
                      );
                    }
                  );
                } else {
                  Get.snackbar(
                    "Error",
                    "Passwords do not match!",
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
            ),

              const SizedBox(height: 20),
              
              Row(
                children: [
                  const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  TextButton(
                    onPressed: () {
                       Get.to(
                      const SignInScreen(), 
                      transition: Transition.rightToLeft, duration: const Duration(seconds: 1)
                      );
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: ThemeColor.accentText,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
