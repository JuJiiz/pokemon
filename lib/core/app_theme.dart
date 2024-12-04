import 'package:flutter/material.dart';

const Color appPrimaryColor = Color(0xFFC9A338);
const Color appOnPrimaryColor = Color(0xFFFFFFFF);
const Color appSecondaryColor = Color(0xFFF5C349);
const Color appOnSecondaryColor = Color(0xFFFFFFFF);

const Color appSurfaceColor = Color(0xFF101010);
const Color appLightSurfaceColor = Color(0xFF202020);
const Color appOnSurfaceColor = Color(0xFFFFFFFF);

const Color appWhiteColor = Color(0xFFFFFFFF);
const Color appOnWhiteColor = Color(0xFF101010);

const Color appPrimaryTextColor = Color(0xFF101010);
const Color appSecondaryTextColor = Color(0xFF808080);

const TextStyle font400$10 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w400, fontSize: 10);
const TextStyle font400$12 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w400, fontSize: 12);
const TextStyle font400$14 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w400, fontSize: 14);
const TextStyle font400$16 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w400, fontSize: 16);
const TextStyle font400$18 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w400, fontSize: 18);
const TextStyle font400$20 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w400, fontSize: 20);

const TextStyle font500$10 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w500, fontSize: 10);
const TextStyle font500$12 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w500, fontSize: 12);
const TextStyle font500$14 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w500, fontSize: 14);
const TextStyle font500$16 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w500, fontSize: 16);
const TextStyle font500$18 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w500, fontSize: 18);
const TextStyle font500$20 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w500, fontSize: 20);

const TextStyle font700$10 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w700, fontSize: 10);
const TextStyle font700$12 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w700, fontSize: 12);
const TextStyle font700$14 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w700, fontSize: 14);
const TextStyle font700$16 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w700, fontSize: 16);
const TextStyle font700$18 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w700, fontSize: 18);
const TextStyle font700$20 =
    TextStyle(fontFamily: 'Prompt', fontWeight: FontWeight.w700, fontSize: 20);

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: appPrimaryColor,
    onPrimary: appOnPrimaryColor,
    secondary: appSecondaryColor,
    onSecondary: appOnSecondaryColor,
    surface: appSurfaceColor,
    onSurface: appOnSurfaceColor,
  ),
  useMaterial3: true,
  cardTheme: const CardTheme(
    color: appWhiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
);
