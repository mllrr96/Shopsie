import 'package:fluttertoast/fluttertoast.dart';
import 'package:medusa_flutter/medusa_flutter.dart';
import 'package:shopsie/main.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileTabController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController groupTabController;
  Customer? customer;

  @override
  void onInit() {
    groupTabController = TabController(vsync: this, length: 5);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    final result = await medusa.customers.retrieve();
    result.when((success) {
      customer = success.customer;
      update();
    }, (error) {
      Get.back();
      Fluttertoast.showToast(msg: "Couldn't load customer");
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
