import 'package:flutter/material.dart';
import 'package:get/get.dart';

ErrorMassage(err, msg) {
  return Get.snackbar(
    err,
    msg,
    icon: err == 'Error'
        ? Icon(Icons.error, color: Colors.white)
        : Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.TOP,
    backgroundColor: err == 'Error' ? Colors.red : Colors.green,
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: 4),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
