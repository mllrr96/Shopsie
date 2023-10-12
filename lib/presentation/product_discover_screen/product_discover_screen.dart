import 'package:flutter_svg/svg.dart';

import '../product_discover_screen/widgets/gridproductname_item_widget.dart';
import 'controller/product_discover_controller.dart';
import 'models/gridproductname_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';

class ProductDiscoverScreen extends GetWidget<ProductDiscoverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Get.back(), icon: SvgPicture.asset(ImageConstant.imgArrowleft)),
          title: SvgPicture.asset(ImageConstant.imgSignal),
          actions: [
            IconButton(onPressed: onTapImgSearch, icon: SvgPicture.asset(ImageConstant.imgSearch)),
            IconButton(onPressed: onTapImgCart, icon: SvgPicture.asset(ImageConstant.imgCart)),
            IconButton(onPressed: onTapImgUser, icon: SvgPicture.asset(ImageConstant.imgUser)),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Padding(
                    padding: getPadding(left: 16, top: 22, right: 16),
                    child: Obx(() => GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: getVerticalSize(309.00),
                            crossAxisCount: 2,
                            mainAxisSpacing: getHorizontalSize(16.00),
                            crossAxisSpacing: getHorizontalSize(16.00)),
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.productDiscoverModelObj.value.gridproductnameItemList.length,
                        itemBuilder: (context, index) {
                          GridproductnameItemModel model =
                              controller.productDiscoverModelObj.value.gridproductnameItemList[index];
                          return GridproductnameItemWidget(model, onTapColumnproductname: () {
                            Get.toNamed(AppRoutes.productPageScreen, arguments: {
                              NavigationArgs.productId:
                                  controller.productDiscoverModelObj.value.gridproductnameItemList[index].idTxt
                            });
                          });
                        })))
              ])),
        ));
  }

  onTapColumnproductname(id) {
    Get.toNamed(AppRoutes.productPageScreen, arguments: {NavigationArgs.productId: id});
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapImgSearch() {
    Get.toNamed(AppRoutes.productSearchScreen);
  }

  onTapImgCart() {
    Get.toNamed(AppRoutes.cartScreen);
  }

  onTapImgUser() {
    Get.toNamed(AppRoutes.profileTabScreen);
  }
}
