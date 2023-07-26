import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_practice_magic_ball/presentation/magic_ball/magic_ball_page.dart';
import 'package:surf_practice_magic_ball/presentation/theme/cubit/theme_cubit.dart';
import 'package:surf_practice_magic_ball/presentation/theme/cubit/theme_state.dart';
import 'package:surf_practice_magic_ball/presentation/theme/theme_colors.dart';
import 'package:surf_practice_magic_ball/presentation/theme/theme_enum.dart';

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ChangeThemeState>(
        bloc: changeThemeCubit,
        builder: (context, themeState) {
          return ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                title: 'Magic ball',
                theme: themeState.themeData,
                home: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        themeState.customColors[AppColors.gradientTop] ??
                            Colors.red,
                        themeState.customColors[AppColors.gradientBottom] ??
                            Colors.red,
                      ],
                      stops: const [
                        //0.2,
                        0,
                        1,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Scaffold(
                    extendBodyBehindAppBar: true,
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      actions: [
                        IconButton(
                          onPressed: () async {
                            await changeThemeCubit.getThemeType() ==
                                    ThemeType.dark
                                ? changeThemeCubit.changeToDarkTheme()
                                : changeThemeCubit.changeToLightTheme();
                          },
                          icon: const Icon(Icons.settings),
                        ),
                      ],
                    ),
                    body: MagicBallPage(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
