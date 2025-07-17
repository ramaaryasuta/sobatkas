import 'package:flutter/material.dart';
import 'package:sobatkas/core/styles/colors.dart';
import 'package:sobatkas/core/styles/text_theme.dart';

ThemeData mainTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
  useMaterial3: true,
  textTheme: sobatKasTextTheme,
);
