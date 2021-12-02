import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//
import 'package:instagram_clone_app/src/util/uxutil.dart';

class InteraccionInstaProvider extends ChangeNotifier {
  bool _showHistory = false;

  bool get showHistory => _showHistory;

  set showHistory(bool value) {
    _showHistory = value;
    notifyListeners();
  }

  bool _isModeDarkEnabled = false;

  ThemeData get currentTheme => _isModeDarkEnabled
      ? ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: primaryColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: secondColor),
            textTheme: TextTheme(
              headline6: GoogleFonts.lobsterTwo(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 34,
              ),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: primaryColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: secondColor,
            unselectedItemColor: secondColor,
            selectedIconTheme: IconThemeData(size: 32),
            unselectedIconTheme: IconThemeData(size: 28),
            type: BottomNavigationBarType.fixed,
          ),
          scaffoldBackgroundColor: primaryColor,
        )
      : ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: secondColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: primaryColor),
            textTheme: TextTheme(
              headline6: GoogleFonts.lobsterTwo(
                fontStyle: FontStyle.italic,
                color: primaryColor,
                fontSize: 34,
              ),
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: secondColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: primaryColor,
            unselectedItemColor: primaryColor,
            selectedIconTheme: IconThemeData(size: 32),
            unselectedIconTheme: IconThemeData(size: 28),
            type: BottomNavigationBarType.fixed,
          ),
          scaffoldBackgroundColor: secondColor,
        );

  bool get isDarkEnabled => _isModeDarkEnabled;

  set isDarkEnabled(bool value) {
    _isModeDarkEnabled = value;
    notifyListeners();
  }

  bool _isLike = false;
  bool _isSave = false;
  bool _isShow = false;

  bool get isLike => _isLike;

  set isLike(bool value) {
    _isLike = value;
    notifyListeners();
  }

  bool get isSave => _isSave;

  set isSave(bool value) {
    _isSave = value;
    notifyListeners();
  }

  bool get isShow => _isShow;

  set isShow(bool value) {
    _isShow = value;
    notifyListeners();
  }
}
