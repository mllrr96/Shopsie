import 'package:fluttertoast/fluttertoast.dart';
import 'package:medusa_flutter/models/req/store_post_auth_req.dart';

import '../../../core/utils/progress_dialog_utils.dart';
import '../../../main.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    // String userId = Get.find<PrefUtils>().getCustomerId();
    // if (userId.isNotEmpty) {
    //   Get.offNamed(AppRoutes.mainLandingScreen);
    // }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }


  Future<void> onLoginTap ()async{
    if (!formKey.currentState!.validate()) return;
    ProgressDialogUtils.showProgressDialog();
    final authResult = await medusa.auth.authenticate(
        req: StorePostAuthReq(
          email: emailController.text,
          password: passwordController.text,
        ));
    authResult.when((success) {
      final customer = success.customer;
      PrefUtils.setCustomerId(customer!.id!.toString());
      PrefUtils.setFirstName(customer.firstName!.toString());
      PrefUtils.setEmail(customer.email.toString());
      PrefUtils.setLastName(customer.lastName!.toString());
      // PrefUtils.setCartId(getCustomerIdResp.cart!.id!.toString());
      ProgressDialogUtils.hideProgressDialog();
      Get.offNamed(AppRoutes.mainLandingScreen);
    }, (error) {
      ProgressDialogUtils.hideProgressDialog();
      Fluttertoast.showToast(
        msg: error.message,
      );
    });
  }

}
