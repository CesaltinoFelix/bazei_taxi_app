import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundButtonCircularProgress extends StatelessWidget {
  const RoundButtonCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      enableFeedback: false,
      minWidth: double.maxFinite,
      elevation: 0,
      color: ThemeColor.secondary,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        width: 24, // Ajuste o valor conforme necessário
        height: 24, // Ajuste o valor conforme necessário
        child: CircularProgressIndicator(
          color: ThemeColor.primaryTextWhite,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
