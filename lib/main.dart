import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/onboarding/onboarding_screen.dart';
import 'package:islami/screens/hadeeth_datails.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/sura_details.dart';
import 'package:islami/services/quran_services.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranServices.getSuarsFromMostRecently();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp( IslamiApp(isOnboardingSeen: prefs.getBool('onboarding_done')??false,));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key,required this.isOnboardingSeen});

  final bool isOnboardingSeen;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraDetailsScreen.routeName: (_) => const SuraDetailsScreen(),
        HadeethDatails.routeName: (_) => const HadeethDatails(),
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
      },
      initialRoute:isOnboardingSeen? HomeScreen.routeName:OnboardingScreen.routeName,
    );
  }
}
