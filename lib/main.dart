// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_one/Auth/Login.dart';
import 'package:network_one/Auth/SignUp.dart';
import 'package:network_one/View/Admin/AdminDashboard.dart';
import 'package:network_one/View/User/UserDashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: checkUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data ?? LoginPage();
          } else {
            return SignUpPage();
          }
        },
      ),
    );
  }
}

Future<Widget> checkUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var userCheck = prefs.getBool('login') ?? false;
  if (userCheck) {
    var UserType = prefs.getString('UserType');
    print(" The Type is :${UserType}");

    if (UserType == 'admin') {
      print('You are an admin!');
      return AdminDashboard();
    } else {
      print('You are user!');
      return UserDashboard();
    }
  } else {
    return LoginPage();
  }
}