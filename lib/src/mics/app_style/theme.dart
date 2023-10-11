import '../../../src_exports.dart';

final AppThemes themes = AppThemes();

class AppThemes {
  static ThemeData lightTheme = /*ThemeData.light();*/ ThemeData();
  static ThemeData darkTheme = /*ThemeData.dark()*/ ThemeData();

  static const _key = 'themeMode';

  // bool get isDarkMode {
  //   return prefs.getValue(key: _key) ?? false;
  // }

  // ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeData get dark => theme(AppColors.whiteClr, Brightness.dark);

  ThemeData get light => theme(AppColors.blackClr, Brightness.light);

  final borderRadius = BorderRadius.circular(60.0);

  final buttonRadius = BorderRadius.circular(30.0);

  static const fontFamily = 'Poppins';

  final fixedSize = const Size(double.infinity, 50);

  ThemeData theme(Color color, Brightness brightness) {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      fontFamily: fontFamily,
      brightness: brightness,
      appBarTheme: appBarTheme(color),
      listTileTheme: listTileTheme(color),
      colorScheme: colorScheme(color, brightness),
      elevatedButtonTheme: elevatedButtonTheme(),
      outlinedButtonTheme: outlinedButtonTheme(color),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColors.whiteClr,
        hintStyle: TextStyle(color: AppColors.primaryTextColor),
        filled: false,
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(),
      ),
    );
  }

  ElevatedButtonThemeData elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.whiteClr,
        backgroundColor: AppColors.primaryButtonColor,
        fixedSize: fixedSize,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
      ),
    );
  }

  ColorScheme colorScheme(Color color, Brightness brightness) {
    if (brightness == Brightness.light) {
      return ColorScheme.light(
        primary: AppColors.primaryColor,
        brightness: brightness,
      );
    }
    return ColorScheme.dark(
      primary: AppColors.primaryColor,
      brightness: brightness,
    );
  }

  ListTileThemeData listTileTheme(Color color) {
    return ListTileThemeData(
      tileColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  OutlinedButtonThemeData outlinedButtonTheme(Color color) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        fixedSize: fixedSize,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
        textStyle: TextStyle(
          color: color,
          fontSize: 18,
          fontFamily: fontFamily,
        ),
      ),
    );
  }

  AppBarTheme appBarTheme(Color color) {
    return AppBarTheme(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
      elevation: 0.0,
      titleSpacing: 0.0,
      color: AppColors.primaryColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: color),
      actionsIconTheme: IconThemeData(color: color),
      titleTextStyle: const TextStyle(
        color: AppColors.whiteClr,
        fontSize: 20,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
