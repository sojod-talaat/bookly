import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/cupertino.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMassge;
  const CustomErrorWidget(this.errorMassge);

  @override
  Widget build(Object context) {
    return Text(
      errorMassge,
      style: Style.textStyle18,
    );
  }
}
