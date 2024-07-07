import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/utils/binding/Binding.dart';
import 'package:frontend/view/screen/class_manage/classes.dart';
import 'package:frontend/view/screen/home/Home.dart';
import 'package:frontend/view/screen/home/student/student%20payments/payment_test1.dart';
import 'package:frontend/view/screen/login.dart';
import 'package:frontend/view/screen/signup/signupInfo.dart';
import 'package:frontend/view/screen/welcome_page.dart';
import 'package:frontend/view/tools/http_client.dart';
import 'package:get/get.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Kindergarten Welcome',
      textDirection: TextDirection.rtl,
      home: const WelcomePage(),
      initialBinding: AllBinding(),
    );
  }
}