import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopsie/widgets/search_text_field.dart';

import 'controller/product_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';

class ProductSearchScreen extends GetWidget<ProductSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: SvgPicture.asset(ImageConstant.imgArrowleft),
                    splashRadius: 25,
                  ),
                  Flexible(
                    child: SearchTextField(
                      controller: controller.appbarController,
                      hintText: "lbl_search".tr,
                      fillColor: ColorConstant.gray50,
                      autoFocus: true,
                    ),
                  ),
                ],
              ),
            )),
        body: SafeArea(child: Placeholder()));
  }
}
