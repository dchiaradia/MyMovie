import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGetSnackBar {
  final String title;
  final String description;
  final SnackPosition? position;

  MyGetSnackBar({
    required this.title,
    required this.description,
    this.position = SnackPosition.BOTTOM,
  });

  error({IconData icon = Icons.warning_amber}) {
    Get.snackbar(title, description,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: Icon(icon),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20));
  }

  warning({IconData icon = Icons.warning_amber}) {
    Get.snackbar(title, description,
        backgroundColor: Colors.orange,
        colorText: Colors.black,
        icon: Icon(icon),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20));
  }

  success({IconData icon = Icons.check_circle_outline}) {
    Get.snackbar(title, description,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: Icon(icon),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20));
  }
}
