import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// split them based on size at most
abstract class Style {
  static const textStyle18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const textStyle20 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);
  static const textStyle14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  static const textStyle16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const textStyle30 =
      TextStyle(fontSize: 30, fontWeight: FontWeight.normal);
}
