import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle regular24({Color? color}) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,

    color: color ?? Colors.white,
  );

  static TextStyle medium24({Color? color}) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,

    color: color ?? Colors.white,
  );

  static TextStyle regular18({Color? color}) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,

    color: color ?? Colors.white,
  );

  static TextStyle medium18({Color? color}) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,

    color: color ?? Colors.white,
  );

  static TextStyle bold20({Color? color}) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,

    color: color ?? Colors.white,
  );

  static TextStyle regular16({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,

    color: color ?? Colors.white,
  );

  static TextStyle medium16({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,

    color: color ?? Colors.white,
  );

  static TextStyle regular12({Color? color}) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,

    color: color ?? Colors.white,
  );

  static TextStyle medium12({Color? color}) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,

    color: color ?? Colors.white,
  );
}
