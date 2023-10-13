import '/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileProfileInfoController extends GetxController {
  ProfileProfileInfoController();

  TextEditingController firstNameOneController = TextEditingController();

  TextEditingController lastNameOneController = TextEditingController();

  TextEditingController emailOneController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    firstNameOneController.dispose();
    lastNameOneController.dispose();
    emailOneController.dispose();
  }
}
