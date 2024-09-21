import 'package:bazei_taxi_app/screens/home_screen.dart';
import 'package:bazei_taxi_app/widgets/round_button_circular_progress.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:bazei_taxi_app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class OTPScreen extends StatefulWidget {
  final String? number;
  final String? name;
  final String? password;

  const OTPScreen({super.key, required this.number, required this.name, required this.password});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
OtpTimerButtonController controller = OtpTimerButtonController();
bool isLoading = false;
bool askCode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
        }, 
        icon: Image.asset(
        "assets/images/Arrow 1.png", 
        width: 15,
        height: 15,)
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            // Texto "Create new account"
            const Text(
              "OTP Verification",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             Row(
              children:  [
                 Text(
                    "hey, ${widget.name}!\nPlease, enter the 5-digit code sent to you at",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),

            Row(
              children: [
                Text(
                    "${widget.number}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    Get.back(); // Retorna para a tela anterior (Login)
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: ThemeColor.accentText,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
           OtpTextField(
                  numberOfFields: 5,
                  borderColor: Color(0xFF512DA8),
                  showFieldAsBox: true, 
                  textStyle: TextStyle(color: ThemeColor.primaryTextWhite, fontSize: 22),
                  onCodeChanged: (String code) {
                  },
                  onSubmit: (String verificationCode){
                      // showDialog(
                      //     context: context,
                      //     builder: (context){
                      //     return AlertDialog(
                      //         title: Text("Verification Code"),
                      //         content: Text('Code entered is $verificationCode'),
                      //     );
                      //     }
                      // );
                  }, 
            ),
            const SizedBox(height: 40),
            
            isLoading ? 
            const RoundButtonCircularProgress()
            : 
            RoundButton(
              title: "SIGN UP",
              onPressed: () async{
                 setState((){
                  isLoading = true;
                });
                  // Simulate user creation 
                 bool userCreated = await Future.delayed(const Duration(seconds: 2), () => true);

                  if (userCreated) {
                    Get.snackbar(
                      "Success",
                       "User created: ${widget.name}, ${widget.number}",
                      backgroundColor: Colors.green[400],
                      colorText: Colors.white,
                      duration: const Duration(seconds: 3),
                    );

                    Future.delayed(const Duration(seconds: 4), () {
                    setState((){
                    isLoading = false;
                    });
                    Get.to(
                      const HomeScreen(), 
                      transition: Transition.rightToLeft, duration: const Duration(seconds: 1)
                      );
                    }
                  );

                  } else {
                    // Handle creation failure (optional)
                     setState((){
                      isLoading = false;
                     });
                  }
              },
            ),
            Center(
        child: OtpTimerButton(
              controller: controller,
              height: 60,
              onPressed: () {
                controller.loading();
                Future.delayed(Duration(seconds: 2), () {
                  controller.startTimer();
                });
              },
              text: Text(
                'Resend code',
                style:  TextStyle(fontSize: 16, color: ThemeColor.accentText) ,
              ),
              buttonType: ButtonType.text_button,
              textColor: Colors.white,
              duration: 60,

            ),
      ),
          ],
        ),
      ),
    );
  }
}
