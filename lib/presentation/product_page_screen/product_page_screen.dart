import 'package:flutter_svg/svg.dart';
import 'package:shopsie/presentation/cart_screen/widgets/bottom_nav_bar_button.dart';

import 'controller/product_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';

class ProductPageScreen extends GetWidget<ProductPageController> {
  @override
  Widget build(BuildContext context) {
    final product = controller.product;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(onPressed: () => Get.back(), icon: SvgPicture.asset(ImageConstant.imgArrowleft)),
              title: SvgPicture.asset(ImageConstant.imgSignal),
              actions: [
                IconButton(
                    onPressed: () => Get.toNamed(AppRoutes.productSearchScreen),
                    splashRadius: 25,
                    icon: SvgPicture.asset(ImageConstant.imgSearch)),
                IconButton(
                    onPressed: () => Get.toNamed(AppRoutes.cartScreen),
                    splashRadius: 25,
                    icon: SvgPicture.asset(ImageConstant.imgCart)),
                IconButton(
                    onPressed: () => Get.toNamed(AppRoutes.profileTabScreen),
                    splashRadius: 25,
                    icon: SvgPicture.asset(ImageConstant.imgUser)),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BottomNavigationBarButton(
                  onPress: (){
                    onTapBtnAddtocart(product.variants?.first.id ?? '');
                  },
                  label: 'ADD TO CART',
                  textStyle: TextStyle(
                    color: ColorConstant.whiteA700,
                    fontSize: getFontSize(13),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
              buttonWidth: double.maxFinite,
              ),
            ),
            body: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      width: double.infinity,
                      decoration: AppDecoration.fillWhiteA700,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    height: getVerticalSize(436.00),
                                    width: size.width,
                                    child: Stack(alignment: Alignment.bottomCenter, children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: CommonImageView(
                                              url: controller.product.thumbnail,
                                              height: getVerticalSize(436.00),
                                              width: getHorizontalSize(390.00))),
                                    ]))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 16, top: 30, right: 16),
                                    child: Obx(() => Text(product.title ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtLatoRegular24.copyWith(letterSpacing: 0.72, height: 1.00))))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 16, top: 20, right: 16),
                                    child: Obx(() => Text(product.variants?.first.prices?.first.amount.toString() ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLatoMedium20.copyWith())))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(left: 16, top: 33, right: 16),
                                    child: Text("lbl_product_details".tr.toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLatoSemiBold14.copyWith()))),
                            Container(
                                width: getHorizontalSize(358.00),
                                margin: getMargin(left: 16, top: 21, right: 16),
                                child: Obx(() => Text(product.description ?? '',
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtLatoRegular14.copyWith()))),
                          ]))
                ]))));
  }

  void onTapBtnAddtocart(String variantId) {
    // PostCartIdLineItemsReq postCartIdLineItemsReq = PostCartIdLineItemsReq(
    //   variantId: variantId,
    //   quantity: Shopsie.qty,
    // );
    // controller.callCreateCartIdLineItems(
    //   postCartIdLineItemsReq.toJson(),
    //   successCall: _onCreateCartIdLineItemsSuccess,
    //   errCall: _onCreateCartIdLineItemsError,
    //   cartId: PrefUtils.getCartId(),
    // );
    // Fluttertoast.showToast(msg: "Added into cart!");
  }

}
