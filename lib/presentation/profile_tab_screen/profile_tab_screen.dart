import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopsie/presentation/profile_logout_page/profile_logout_page.dart';
import 'package:shopsie/presentation/profile_my_orders_page/profile_my_orders_page.dart';
import 'package:shopsie/presentation/profile_profile_info_page/profile_profile_info_page.dart';
import 'package:shopsie/presentation/profile_security_page/profile_security_page.dart';

import 'controller/profile_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';
import 'package:shopsie/presentation/profile_address_details_page/profile_address_details_page.dart';
import 'package:shopsie/widgets/custom_icon_button.dart';

class ProfileTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileTabController>(builder: (controller) {
      final customer = controller.customer;
      return Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset(ImageConstant.imgSignal),
            leading: IconButton(onPressed: () => Get.back(), icon: SvgPicture.asset(ImageConstant.imgArrowleft)),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: getVerticalSize(116.00),
                            width: getHorizontalSize(100.00),
                            margin: getMargin(left: 99, top: 32, right: 99),
                            child: Stack(alignment: Alignment.bottomLeft, children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding: getPadding(bottom: 10),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(getHorizontalSize(50.00)),
                                          child: CommonImageView(
                                              imagePath: ImageConstant.imageNotFound,
                                              height: getSize(100.00),
                                              width: getSize(100.00))))),
                              CustomIconButton(
                                  height: 32,
                                  width: 32,
                                  margin: getMargin(left: 31, top: 10, right: 31),
                                  alignment: Alignment.bottomLeft,
                                  child: CommonImageView(svgPath: ImageConstant.imgVectorGray900))
                            ])),
                        Padding(
                            padding: getPadding(left: 99, top: 12, right: 98),
                            child: Text(customer?.firstName ?? '',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLatoRegular18.copyWith(letterSpacing: 1.08))),
                        Padding(
                            padding: getPadding(left: 99, top: 17, right: 99, bottom: 34),
                            child: Text(customer?.email ?? '',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLatoRegular14Gray600.copyWith()))
                      ]),
                  Container(
                      width: size.width,
                      margin: getMargin(top: 16),
                      child: TabBar(
                          controller: controller.groupTabController,
                          labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          tabs: [
                            Tab(child: Text("lbl_profile_info".tr, style: TextStyle(fontSize: 12))),
                            Tab(child: Text("lbl_my_orders".tr, style: TextStyle(fontSize: 12))),
                            Tab(child: Text("lbl_security".tr, style: TextStyle(fontSize: 12))),
                            Tab(child: Text("lbl_address_details".tr, style: TextStyle(fontSize: 12))),
                            Tab(child: Text("lbl_log_out".tr, style: TextStyle(fontSize: 12))),
                          ],
                          labelColor: ColorConstant.gray600,
                          unselectedLabelColor: ColorConstant.gray600)),
                  Container(
                      margin: getMargin(left: 16, top: 40, right: 16),
                      height: getVerticalSize(288.00),
                      child: TabBarView(
                        //tabs:[]
                          controller: controller.groupTabController,
                          children: [
                            ProfileProfileInfoPage(),
                            ProfileMyOrdersPage(),
                            ProfileSecurityPage(),
                            ProfileAddressDetailsPage(),
                            ProfileLogoutPage(),
                          ]))
                ])),
          ));
    });
  }

  onTapImgSearch() {
    Get.toNamed(AppRoutes.productSearchScreen);
  }

  onTapImgCart() {
    Get.toNamed(AppRoutes.cartScreen);
  }
}
