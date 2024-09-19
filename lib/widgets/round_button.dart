import 'package:bazei_taxi_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;

  const RoundButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.maxFinite,
      elevation: 0,
      color: ThemeColor.secondary,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text(
          title,
          style: TextStyle(
            color: ThemeColor.primaryTextWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        ),
    );
  }
}