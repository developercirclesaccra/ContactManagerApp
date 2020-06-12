import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(context) {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cursorColor: Colors.blue,
      errorColor: Colors.red,
      platform: defaultTargetPlatform,
      primaryColor: Colors.blue,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.blue),
      brightness: Brightness.light,
      disabledColor: Colors.grey,
      iconTheme: IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(
          elevation: Platform.isIOS ? 0 : 4,
          color: Colors.blue,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyText1: TextStyle(color: Colors.black, fontSize: 16),
            bodyText2: TextStyle(color: Colors.black, fontSize: 14),
            caption: TextStyle(color: Colors.black, fontSize: 12),
            headline1: TextStyle(color: Colors.black, fontSize: 96),
            headline2: TextStyle(color: Colors.black, fontSize: 60),
            headline3: TextStyle(color: Colors.black, fontSize: 48),
            headline4: TextStyle(color: Colors.black, fontSize: 34),
            headline5: TextStyle(color: Colors.black, fontSize: 24),
            headline6: TextStyle(color: Colors.black, fontSize: 20),
            subtitle1: TextStyle(color: Colors.black, fontSize: 16),
            subtitle2: TextStyle(color: Colors.black, fontSize: 14),
            overline: TextStyle(color: Colors.black, fontSize: 10),
            button: TextStyle(color: Colors.black, fontSize: 16),
          ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      alignLabelWithHint: true,
      hintStyle: Theme.of(context).textTheme.bodyText1,
      contentPadding: EdgeInsets.all(15.0),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(.5)),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      labelStyle: Theme.of(context).textTheme.bodyText2,
      errorStyle:
      Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.red),
    ),);
}

//dark theme
ThemeData darkTheme(context) {
  return ThemeData(
      scaffoldBackgroundColor: Colors.black87,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cursorColor: Colors.blue,
      errorColor: Colors.red,
      platform: defaultTargetPlatform,
      primaryColor: Colors.blue,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.blue),
      brightness: Brightness.dark,
      disabledColor: Colors.grey,
      iconTheme: IconThemeData(color: Colors.white70),
      appBarTheme: AppBarTheme(
          elevation: Platform.isIOS ? 0 : 4,
          color: Colors.blue,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyText1: TextStyle(color: Colors.white, fontSize: 16),
            bodyText2: TextStyle(color: Colors.white, fontSize: 14),
            caption: TextStyle(color: Colors.white, fontSize: 12),
            headline1: TextStyle(color: Colors.white, fontSize: 96),
            headline2: TextStyle(color: Colors.white, fontSize: 60),
            headline3: TextStyle(color: Colors.white, fontSize: 48),
            headline4: TextStyle(color: Colors.white, fontSize: 34),
            headline5: TextStyle(color: Colors.white, fontSize: 24),
            headline6: TextStyle(color: Colors.white, fontSize: 20),
            subtitle1: TextStyle(color: Colors.white, fontSize: 16),
            subtitle2: TextStyle(color: Colors.white, fontSize: 14),
            overline: TextStyle(color: Colors.white, fontSize: 10),
            button: TextStyle(color: Colors.white, fontSize: 16),
          ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      alignLabelWithHint: true,
      hintStyle: Theme.of(context).textTheme.bodyText1,
      contentPadding: EdgeInsets.all(15.0),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(.5)),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      labelStyle: Theme.of(context).textTheme.bodyText2,
      errorStyle:
      Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.red),
    ),);
}
