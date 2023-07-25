import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/presentation/screen/magic_ball_screen.dart';
import 'package:surf_practice_magic_ball/presentation/theme/cubit/theme_cubit.dart';
import 'package:surf_practice_magic_ball/presentation/theme/cubit/theme_state.dart';
import 'package:surf_practice_magic_ball/presentation/theme/theme_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ChangeThemeState>(
        bloc: changeThemeCubit,
        builder: (context, themeState) {
          return const Scaffold(
            body: MagicBallScreen(),
          );
        });
  }
}
