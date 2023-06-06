import 'package:flutter/material.dart';

Widget addH(double h) {
  return SizedBox(height: h);
}

Widget addW(double w) {
  return SizedBox(width: w);
}
InputBorder getInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular( 5.0),
    borderSide: const BorderSide(
      color: Colors.transparent,
      width: 1,
    ),
  );
}