import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopsie/presentation/cart_screen/widgets/bottom_nav_bar_button.dart';
import 'controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CartScreen extends GetWidget<CartController> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(ImageConstant.imgArrowleft),
          ),
          title: SvgPicture.asset(ImageConstant.imgSignal),
        ),

        // bottomNavigationBar: Container(
        //   height: 10,
        //   child: CustomButton(
        //       width: 326,
        //       text:
        //       "Place Order".tr.toUpperCase(),
        //       margin: getMargin(
        //           left: 16, top: 10, right: 16),
        //       onTap: onTapBtnPay,
        //       alignment: Alignment.center),
        // ),
        bottomNavigationBar: BottomNavigationBarButton(
          onPress: () {},
          label: "Place Order".tr.toUpperCase(),
          buttonWidth: 326,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    margin: getMargin(top: 26),
                    decoration: AppDecoration.fillWhiteA700,
                    child:
                        Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 26, right: 26),
                              child: Text("lbl_my_cart".tr.toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLatoRegular18.copyWith(letterSpacing: 1.08)))),
                      // Align(
                      //     alignment: Alignment.center,
                      //     child: Padding(
                      //         padding: getPadding(left: 16, top: 28, right: 16),
                      //         child: Obx(() => ListView.separated(
                      //             physics: BouncingScrollPhysics(),
                      //             shrinkWrap: true,
                      //             separatorBuilder: (context, index) {
                      //               return Container(
                      //                   height: getVerticalSize(1.00),
                      //                   width: getHorizontalSize(358.00),
                      //                   decoration: BoxDecoration(color: ColorConstant.gray200));
                      //             },
                      //             itemCount: controller.cartModelObj.value.cartItemList.length,
                      //             itemBuilder: (context, index) {
                      //               CartItemModel model = controller.cartModelObj.value.cartItemList[index];
                      //               return CartItemWidget(model, onTapImgTrash: () {
                      //                 controller.callDeleteLineItems(
                      //                     successCall: _onDeleteLineItemsSuccess,
                      //                     errCall: _onDeleteLineItemsError,
                      //                     cartId: PrefUtils.getCartId(),
                      //                     lineItems: model.itemId.value);
                      //               }, onTapImgMinus: () {
                      //                 PostLineItemsReq postLineItemsReq =
                      //                     PostLineItemsReq(quantity: int.parse(model.qtyTxt.toString()) - 1);
                      //                 if (postLineItemsReq.quantity != 0) {
                      //                   controller.callCreateLineItems(postLineItemsReq.toJson(),
                      //                       successCall: _onCreateLineItemsSuccess,
                      //                       errCall: _onCreateLineItemsError,
                      //                       cartId: PrefUtils.getCartId(),
                      //                       lineItems: model.itemId.value);
                      //                 }
                      //               }, onTapImgPlus: () {
                      //                 PostLineItemsReq postLineItemsReq =
                      //                     PostLineItemsReq(quantity: int.parse(model.qtyTxt.toString()) + 1);
                      //                 controller.callCreateLineItems(postLineItemsReq.toJson(),
                      //                     successCall: _onCreateLineItemsSuccess,
                      //                     errCall: _onCreateLineItemsError,
                      //                     cartId: PrefUtils.getCartId(),
                      //                     lineItems: model.itemId.value);
                      //               });
                      //             })))),
                      Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 98),
                          decoration: BoxDecoration(color: ColorConstant.gray200)),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 16, top: 23, right: 16),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 3, bottom: 1),
                                        child: Text("lbl_total".tr.toUpperCase(),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtLatoSemiBold14.copyWith())),
                                    Text('Test',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLatoRegular18.copyWith(letterSpacing: 1.08))
                                  ]))),
                      Container(
                          height: getVerticalSize(1.00),
                          width: size.width,
                          margin: getMargin(top: 23),
                          decoration: BoxDecoration(color: ColorConstant.gray200)),
                    ])))));
  }
}
