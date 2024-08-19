// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_one/View/Admin/AdminDashboard.dart';
import 'package:network_one/View/User/UserDashboard.dart';
import 'package:network_one/Widgets/ErrorMassage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  bool isLoading = false;

  setLoading( bool val) {
    isLoading = val;
    update();
  }

  signUpUser(email, password, name) async {
    try {
      setLoading(true);
      final UserCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var uid = UserCredential.user!.uid;

      var obj = {
        'name': name,
        'email': email,
        'password': password,
        'type': 'admin'
      };
      CollectionReference users = FirebaseFirestore.instance.collection('admin');
      await users.doc(UserCredential.user!.uid).set(obj);
      setLoading(false);
      ErrorMassage('SuccessFully', 'Your Account has been created');
    } catch (e) {
      setLoading(false);
      ErrorMassage('Error', e.toString());
    }
  }

  Future<void> loginUser(String email, String password) async {
  try {
    setLoading(true);
    final UserCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    final userId = UserCredential.user!.uid;
    print(
      'User ID: $userId');
    final userData = await getUserData(userId);
    if (userData != null) {
      // if (userData['block']) {
      //   ErrorMassage('Error', 'You are blocked by the admin');
      // } else {
      // }
        setPreferences(userData);
        navigateToDashboard(userData['type']);
    } else {
      ErrorMassage('Error', 'User data not found');
    }
  } catch (e) {
    setLoading(false);
    ErrorMassage('Error', e.toString());
  } finally {
    setLoading(false);
  }
}

  // Get user data from Firestore
Future<Map<String, dynamic>?> getUserData(String userId) async {
  final usersRef = FirebaseFirestore.instance.collection('user').doc(userId);
  final userData = await usersRef.get();
  if (userData.exists) {
    return userData.data() as Map<String, dynamic>;
  } else {
    final adminRef = FirebaseFirestore.instance.collection('admin').doc(userId);
    final adminData = await adminRef.get();
    if (adminData.exists) {
      return adminData.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }
}

// Navigate to dashboard
void navigateToDashboard(String userType) {
  if (userType == 'user') {
    Get.offAll(UserDashboard());
  } else if (userType == 'admin') {
       Get.offAll(AdminDashboard());

  }
}

// Set preferences
Future<void> setPreferences(Map<String, dynamic> userData) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', true);
    prefs.setString('UserType', userData['type'] );
    prefs.setString('email', userData['email'] );
    prefs.setString('name', userData['name'] );
}

}
