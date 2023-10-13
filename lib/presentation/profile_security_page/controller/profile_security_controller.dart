import '/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileSecurityController extends GetxController {
  ProfileSecurityController();

  TextEditingController currentPasswordController = TextEditingController();

  TextEditingController newPasswordOneController = TextEditingController();



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    currentPasswordController.dispose();
    newPasswordOneController.dispose();
  }

}
