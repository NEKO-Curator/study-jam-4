import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/presentation/screen/magic_ball_screen.dart';
import 'package:surf_practice_magic_ball/presentation/theme/cubit/theme_cubit.dart';
import 'package:surf_practice_magic_ball/presentation/theme/cubit/theme_state.dart';
import 'package:surf_practice_magic_ball/presentation/theme/theme_colors.dart';

import 'utils/observer/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ChangeThemeState>(
      bloc: changeThemeCubit,
      builder: (context, themeState) {
        return MaterialApp(
          theme: ThemeData(
            // textButtonTheme: TextButtonThemeData(style: ButtonStyle(
            //   textStyle:
            // )),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              primary: themeState.customColors[AppColors.white],
              secondary: themeState.customColors[AppColors.black],
              background: themeState.customColors[AppColors.white],
            ),
            useMaterial3: true,
          ),
          home: Scaffold(
            body: const MagicBallScreen(),
          ),
        );
      },
    );
  }
}
