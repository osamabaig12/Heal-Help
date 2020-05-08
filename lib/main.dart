import 'package:flutterapphealhelpversion1/all_users_screen.dart';
import 'package:flutterapphealhelpversion1/change_username_successful.dart';
import 'package:flutterapphealhelpversion1/home_screen.dart';
import 'package:flutterapphealhelpversion1/period_tracker.dart';
import 'change_password_successful.dart';

import 'forum_first.dart';
import 'forum_second.dart';
import 'login.dart';
import 'signup.dart';
import 'colors.dart';
import 'inhale.dart';
import 'chat.dart';
import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'trackers.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Forum',
      /*theme: new ThemeData(
        primarySwatch: AppColorsTheme.myTheme.primarySwatch,
      ),*/
      routes: <String, WidgetBuilder>{
        /*'/':      , //(BuildContext context) => new LoginPage(),*/
        //'/': (BuildContext context) => new ForumPage(),
        '/': (BuildContext context) => new MyHomePage(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/forum': (BuildContext context) => new ForumPage(),
        '/login': (BuildContext context) => new MyHomePage(),
        '/inhale': (BuildContext context) => new MyInhale(),
        '/chat': (BuildContext context) => new AllUsersScreen(),
        '/period': (BuildContext context) => new PeriodPage(),
        '/settings': (BuildContext context) => new SettingsScreen(),
        '/trackers' : (BuildContext context) => new MyTrackers(),
        '/username_accessful' : (BuildContext context) => new ChangeUsername3(),

        //'/forumpost': (BuildContext context) => new ForumDetailPage(),
      },
      initialRoute: '/',
    );
  }
}