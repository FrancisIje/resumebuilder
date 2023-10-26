import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resumebuilder/constants/routes.dart';
import 'package:resumebuilder/screens/choose_profile.dart';
import 'package:resumebuilder/screens/home.dart';
import 'package:resumebuilder/theme/textfield_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return MaterialApp(
            routes: {
              Routes.chooseProfile: (context) => const ChooseProfile(),
              // Routes.chooseTemplate:(context) => const X
            },
            title: 'Flutter Demo',
            theme: ThemeData(
              //from theme/textfield_theme.dart
              inputDecorationTheme: inputDecorationTheme,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomePage(),
          );
        });
  }
}
