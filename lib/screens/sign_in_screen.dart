import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:bazei_taxi_app/screens/home_screen.dart';
import 'package:bazei_taxi_app/screens/sign_up_screen.dart';
import 'package:bazei_taxi_app/widgets/round_button.dart';
import 'package:bazei_taxi_app/widgets/round_button_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
              // Logo centralizado (opcional)
              Image.asset(
                "assets/images/logo.png",
                width: context.width * 0.30,
              ),
              const SizedBox(height: 20),
              const Text(
                "Entrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              IntlPhoneField(
                controller: _phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone, color: Colors.white),
                  labelText: 'Número de Telefone',
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

              const SizedBox(height: 20),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/images/codicon_eye.png"),
                  labelText: "Senha",
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
                style: TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 40),

              isLoading
                  ? const RoundButtonCircularProgress()
                  : RoundButton(
                      title: "SIGN IN",
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        String phone = _phoneController.text;
                        String password = _passwordController.text;

                        try {
                          await Future.delayed(const Duration(seconds: 2));

                          final isAuthenticated = await authenticateUser(phone, password);

                          if (isAuthenticated) {
                            Get.to( HomeScreen(), transition: Transition.rightToLeft, duration: const Duration(seconds: 1));
                          } else {
                            Get.snackbar(
                               "Error",
                              "Invalid credentials",
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        } catch (e) {
                          Get.snackbar(
                           "Error",
                            "An error occurred. Please try again later.",
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Text(
                    "Dont't have account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(SignUpScreen(), transition: Transition.rightToLeft, duration: const Duration(seconds: 1));
                    },
                    child: Text(
                      "Create account",
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

  // Substituir esta função com lógica de autenticação real
  Future<bool> authenticateUser(String phone, String password) async {
   
    return Future.value(true); // Substituir lógica de autenticação real
  }
}