import 'package:flutter/material.dart';
import 'colors.dart';

const primarycolor = Color(0xFFC70000);

const secondarycolor = ColorResources.SCAFFOLDBG;

class MyTheme {
  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: ColorResources.WHITE),
      backgroundColor: ColorResources.SCAFFOLDBGOLD,
      surfaceTintColor: ColorResources.SCAFFOLDBGOLD,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: ColorResources.SCAFFOLDBGOLD,
    iconTheme: IconThemeData(color: ColorResources.ICON_GREY),
    primaryIconTheme: IconThemeData(color: ColorResources.ICON_GREY),
  );
}
