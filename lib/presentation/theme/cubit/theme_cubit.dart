import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_practice_magic_ball/presentation/theme/cubit/theme_state.dart';
import 'package:surf_practice_magic_ball/presentation/theme/theme_enum.dart';

ThemeCubit changeThemeCubit = ThemeCubit()..onDecideThemeChange();

class ThemeCubit extends Cubit<ChangeThemeState> {
  ThemeCubit() : super(ChangeThemeState.lightTheme(type: ThemeType.light));

  void changeToDarkTheme() {
    _saveOptionValue(1);
    emit(ChangeThemeState.darkTheme(type: ThemeType.dark));
  }

  void changeToLightTheme() {
    _saveOptionValue(0);
    emit(ChangeThemeState.lightTheme(type: ThemeType.light));
  }

  void onDecideThemeChange() async {
    final optionValue = await getOption();
    print("optionValue is $optionValue");
    if (optionValue == 0) {
      changeToLightTheme();
    } else if (optionValue == 1) {
      changeToDarkTheme();
    }
  }

  Future<void> _saveOptionValue(int optionValue) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setInt('theme_option', optionValue);
  }

  Future<int> getOption() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      int option = preferences.getInt('theme_option') ?? 0;
      return option;
    } catch (e) {
      return 1;
    }
  }

  Future<ThemeType> getThemeType() async {
    var option = await getOption();
    return ThemeType.values[option];
  }
}
