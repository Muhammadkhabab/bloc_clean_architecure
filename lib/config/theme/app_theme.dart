import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class AppTheme {
  // Define responsive text styles
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.roboto(
      fontSize: 32, // Use ScreenUtil for responsive font size
      fontWeight: FontWeight.bold,
      color: AppColors.onSurfaceColor,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurfaceColor,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurfaceColor,
    ),
    headlineLarge: GoogleFonts.roboto(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.surfaceColor,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.surfaceColor,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.surfaceColor,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurfaceColor,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: AppColors.onSurfaceColor,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.onSurfaceColor,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.bodyTextColor,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.bodyTextColor,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.bodyTextColor,
    ),
    labelLarge: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.labelColour,
    ),
    labelMedium: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.labelColour,
    ),
    labelSmall: GoogleFonts.roboto(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.labelColour,
    ),
  );

  // Define color scheme
  static ColorScheme colorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: AppColors.onPrimaryColor,
    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.onSecondaryColor,
    error: AppColors.errorColor,
    onError: AppColors.onErrorColor,
    surface: AppColors.surfaceColor,
    onSurface: AppColors.onSurfaceColor,
  );

  // Define the app's theme
  static ThemeData themeData = ThemeData(
    textTheme: textTheme,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    disabledColor: AppColors.disabledColor,
    shadowColor: AppColors.shadowColor,
    dividerColor: AppColors.dividerColor,
    cardColor: AppColors.cardColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
      ),
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: textTheme.headlineMedium?.copyWith(color: AppColors.onPrimaryColor),
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.onSecondaryColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.bodyTextColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: textTheme.labelSmall?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w500),
      unselectedLabelStyle: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.onPrimaryColor,
        backgroundColor: AppColors.onPrimaryColor,
        disabledForegroundColor: AppColors.disabledColor,
        disabledBackgroundColor: AppColors.disabledColor,
        textStyle: textTheme.titleMedium?.copyWith(color: AppColors.onPrimaryColor),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Use ScreenUtil for responsive radius
          side: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        disabledForegroundColor: AppColors.disabledColor,
        side: const BorderSide(color: AppColors.primaryColor),
        textStyle: textTheme.bodyLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Responsive radius
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        padding: EdgeInsets.zero,
        disabledForegroundColor: AppColors.disabledColor,
        textStyle: textTheme.bodyLarge,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), // Responsive radius
        borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Responsive padding
    ),

    // Card theme
    cardTheme: CardTheme(
      color: AppColors.cardColor,
      elevation: 2,
      shadowColor: AppColors.shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.borderColor),
      ),
    ),

    // Divider theme
    dividerTheme: const DividerThemeData(
      color: AppColors.borderColor,
      thickness: 1,
    ),
    drawerTheme: DrawerThemeData(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
    // Page transitions theme
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  // System overlay style
  static void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
      ),
    );
  }
}
