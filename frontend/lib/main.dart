import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/core/class/colors.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/utils/binding/Binding.dart';
import 'package:frontend/view/screen/welcome_page.dart';
import 'package:frontend/view/tools/http_client.dart';
import 'package:get/get.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// mainfast
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(106, 27, 154, 1), // Deep Purple
        scaffoldBackgroundColor:
            const Color.fromRGBO(243, 229, 245, 1), // Soft Lavender
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(106, 27, 154, 1),
          titleTextStyle: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(106, 27, 154, 1), // Deep Purple
          secondary: Color.fromRGBO(0, 121, 107, 1), // Soft Lavender
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white, // Midnight Blue
          onSurface: Color.fromRGBO(66, 66, 66, 1), // Dark Gray
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: AppColors.TEXT_PRIMARY, // Headline for prominent displays
          ),
          displayMedium: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: AppColors.TEXT_PRIMARY, // Slightly smaller headlines
          ),
          displaySmall: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: AppColors.TEXT_PRIMARY, // Sub-headlines
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.TEXT_PRIMARY, // Important headlines
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(48, 63, 159, 0.9), // Secondary headlines
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(48, 63, 159, 0.8),
          ),
          titleLarge: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.TEXT_PRIMARY, // Titles
          ),
          titleMedium: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.TEXT_SECONDARY, // Subtitle emphasis
          ),
          titleSmall: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(48, 63, 159, 0.8),
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.TEXT_PRIMARY, // Standard body text
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.TEXT_SECONDARY, // Secondary body text
          ),
          labelLarge: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.BUTTON_TEXT, // Buttons and labels
          ),
          labelSmall: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(48, 63, 159, 0.8),
          ),
          bodySmall: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(48, 63, 159, 0.6),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(106, 27, 154, 1), // Deep Purple
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color.fromRGBO(243, 229, 245, 1), // Soft Lavender
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Color.fromRGBO(106, 27, 154, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(0, 121, 107, 1)),
          ),
          labelStyle: const TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            color: Color.fromRGBO(48, 63, 159, 1), // Midnight Blue
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromRGBO(106, 27, 154, 1), // Deep Purple
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return AppColors.PRIMARY.withOpacity(0.5); // Disabled state
                }
                return AppColors.PRIMARY; // Default state
              },
            ),
            foregroundColor: WidgetStateProperty.all(AppColors.BUTTON_TEXT),
            overlayColor:
                WidgetStateProperty.all(AppColors.PRIMARY.withOpacity(0.1)),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: AppColors.BACKGROUND, // Dialog background
          titleTextStyle: const TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.TEXT_PRIMARY,
          ),
          contentTextStyle: const TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.TEXT_SECONDARY,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
        ),
      ),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Kindergarten Welcome',
      textDirection: TextDirection.rtl,
      home: const WelcomePage(),
      initialBinding: AllBinding(),
    );
  }
}
