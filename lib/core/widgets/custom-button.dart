import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.bacgroundcolor,
      required this.text,
      required this.borderRadius,
      required this.textcolor,
      this.fontsize,
      this.onpresedFunction});
  final Color bacgroundcolor;
  final String text;
  final BorderRadius borderRadius;
  final Color textcolor;
  final double? fontsize;
  final Function()? onpresedFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
              backgroundColor: bacgroundcolor),
          onPressed: onpresedFunction,
          child: Text(
            text,
            style: Style.textStyle18.copyWith(
                color: textcolor,
                fontWeight: FontWeight.bold,
                fontSize: fontsize),
          )),
    );
  }
}
