import 'package:flutter/material.dart';
import 'package:note_keeper/splash_screen.dart';
import 'package:note_keeper/utils/appRoutes.dart';

import '../screen/home_screen/home_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().splashScreen: (context) => IntroScreen(),
  AppRoutes().homePage: (context) => HomePage(),
};
