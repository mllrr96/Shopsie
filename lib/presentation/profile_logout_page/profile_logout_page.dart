import 'package:fluttertoast/fluttertoast.dart';

import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';
import 'package:shopsie/widgets/custom_button.dart';

class ProfileLogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomButton(
        width: 358,
        text: "lbl_logout2".tr.toUpperCase(),
        onTap: onTap,
      ),
    );
  }

  Future<void> onTap() async {
    final result = await medusa.auth.deleteSession();
    if (result) {
      PrefUtils.clearPreferencesData();
      Get.offAllNamed(AppRoutes.loginScreen);
    } else {
      Fluttertoast.showToast(msg: 'Error singing out');
    }
  }
}
