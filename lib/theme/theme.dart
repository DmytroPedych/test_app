// ignore_for_file: deprecated_member_use
import "package:flutter/material.dart";

///
///
///
const Color cbackground = Color(0xFFF5F5F5);
const Color cprimarycolor = Color(0xFFFDBF30);
const Color introPageBgColor = Color(0xffFFC3A6);
const Color detailsPageColor = Color(0xff0d0a18);
const Color elevatedButt = Colors.red;
// class ThemeClass {
//   Color lightPrimaryColor = Colors.grey.shade300;
//   //Color darkPrimaryColor = Colors.grey.shade800;
//   Color darkPrimaryColor = Color(0xFFF5F5F5); //HexColor('#480032');
//   Color cprimarycolor = Color(0xFFFDBF30);

//   static ThemeData lightTheme = ThemeData(
//     primaryColor: ThemeData.light().scaffoldBackgroundColor,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.transparent,
//     ),
//     iconTheme: IconThemeData(color: _themeClass.darkPrimaryColor),
//     //iconButtonTheme: IconButtonThemeData(style: lightPrimaryColor),
//     colorScheme: const ColorScheme.light().copyWith(
//       primary: _themeClass.lightPrimaryColor,
//       secondary: _themeClass.cprimarycolor,
//     ),
//   );
//   static ThemeData darkTheme = ThemeData(
//     primaryColor: ThemeData.dark().scaffoldBackgroundColor,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.transparent,
//     ),
//     iconTheme: IconThemeData(color: _themeClass.darkPrimaryColor),
//     colorScheme: const ColorScheme.dark().copyWith(
//       primary: _themeClass.darkPrimaryColor,
//     ),
//   );
// }

// ThemeClass _themeClass = ThemeClass();

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkModeActive =>
      themeMode == ThemeMode.dark; // if the themeMode is the dark - return true

  void setThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }

  // void toggleTheme(bool isOn) {
  //   themeMode = isOn ? ThemeMode.dark : ThemeMode.light;//вместо єтого setThemeMode
  //   notifyListeners();
  // }
}

class MyTheme {
  // _____________________________________________определяем основньіе цвета темьі приложения для темной и светлой тем
  Color lightPrimaryColor = Colors.grey.shade300;
  Color lightSecondaryColor = Colors.black87;
  Color lightBackgroundColor = Colors.grey.shade100;

  ///
  ///
  ///
  // Color darkBackgroundColor = Colors.grey.shade900;
  // Color darkPrimaryColor = Colors.grey.shade700;
  // Color darkSecondaryColor = Colors.black54;
  Color darkBackgroundColor = Colors.grey[900]!;
  Color darkPrimaryColor = Colors.grey[800]!;
  Color darkSecondaryColor = Colors.grey[700]!;

  /// _________________________________________________________________________________________________________________LIGHT THEME
  // _____________________________________________определяем параметрьі светлой темьі
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // primaryColor: ThemeData.light().scaffoldBackgroundColor,
    textTheme: TextTheme(
      ///
      // для титулки
      headline3: TextStyle(
        fontFamily: 'Times New Roman',
        fontSize: 40.0,
        fontWeight: FontWeight.w800,
        color: Colors.black87.withOpacity(0.5),
      ),

      ///
      //для регистрационной формьі
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue[600],
        fontSize: 14,
      ),

      ///
      //textfield labels
      headline5: TextStyle(
          color: Colors.grey[700], fontSize: 14, fontWeight: FontWeight.bold),
    ),

    ///
    ///
    ///
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.black,
    ),

    ///
    ///
    ///
    iconTheme: IconThemeData(
      color: Colors.black.withOpacity(0.8),
    ),

    ///
    ///
    ///
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15.0),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          _myTheme.lightSecondaryColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(200, 80)),
      ),
    ),

    ///
    ///
    ///
    colorScheme: const ColorScheme.light().copyWith(
      background: _myTheme.lightBackgroundColor,
      // _________________________________________передаем вьібранньій цвет в параметр primaryColor темьі
      primary: _myTheme.lightPrimaryColor,
      secondary: _myTheme.lightSecondaryColor,
    ),
  );

  ///
  ///
  /// _________________________________________________________________________________________________________________DARK THEME
  ///
  // _____________________________________________определяем параметрьі темной темьі
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    textTheme: TextTheme(
      headline3: TextStyle(
        fontFamily: 'Times New Roman',
        fontSize: 40.0,
        fontWeight: FontWeight.w800,
        color: Colors.black87.withOpacity(0.5),
      ),

      ///
      //для регистрационной формьі
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue[600],
        fontSize: 14,
      ),

      ///
      //textfield labels
      headline5: TextStyle(
          color: Colors.grey[100], fontSize: 14, fontWeight: FontWeight.normal),
    ),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.9),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
        background: _myTheme.darkBackgroundColor,
        primary: _myTheme.darkPrimaryColor,
        secondary: _myTheme.darkSecondaryColor
        //secondary
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15.0),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          _myTheme.darkSecondaryColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(200, 80)),
      ),
    ),
  );
}

MyTheme _myTheme = MyTheme();
