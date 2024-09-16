import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home/home.dart';

void goHome(BuildContext context) async {
  Navigator.of(context).pop();
  Future.delayed(const Duration(milliseconds: 500));
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => const Home(),
    ),
  );
}

void goHomeIfAuthenticated(BuildContext context) async {
  SharedPreferences pref =
      await SharedPreferences.getInstance();
  bool? isAuthenticated = pref.getBool('is_authenticated');
  if(isAuthenticated == true) {
    goHome(context);
  }
}