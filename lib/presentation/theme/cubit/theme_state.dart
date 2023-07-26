import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/presentation/theme/base_theme.dart';
import 'package:surf_practice_magic_ball/presentation/theme/theme_enum.dart';
import 'package:equatable/equatable.dart';

class ChangeThemeState extends Equatable {
  final ThemeData themeData;
  final ThemeType type;
  final bool isDarkTheme; //возможно придется поменять
  final Map<String, Color> customColors;

  ChangeThemeState({
    required this.themeData,
    required this.type,
    required this.customColors,
    bool? isDarkTheme,
  }) : isDarkTheme = isDarkTheme ?? themeData.brightness == Brightness.dark;

  factory ChangeThemeState.lightTheme({required ThemeType type}) {
    return ChangeThemeState(
      themeData: getModuleLightTheme(),
      customColors: getLightThemeCustomColors(),
      type: type,
    );
  }

  factory ChangeThemeState.darkTheme({required ThemeType type}) {
    return ChangeThemeState(
      themeData: getModuleDarkTheme(),
      customColors: getDarkThemeCustomColors(),
      type: type,
    );
  }

  @override
  List<Object?> get props => [themeData, type, isDarkTheme, customColors];
}
