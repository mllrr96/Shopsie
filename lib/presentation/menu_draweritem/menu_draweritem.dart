import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopsie/core/app_export.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer(this.controller);

  final MenuController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(child: SvgPicture.asset(ImageConstant.imgSignal, height: 50)),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Center(
                        child: Text("lbl_cart".tr.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoRegular18.copyWith(letterSpacing: 1.08)),
                      ),
                      onTap: () {
                        Get.back();
                        Get.toNamed(AppRoutes.cartScreen);
                      },
                    ),
                    ListTile(
                      title: Center(
                        child: Text("lbl_profile".tr.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoRegular18.copyWith(letterSpacing: 1.08)),
                      ),
                      onTap: () {
                        Get.back();
                        Get.toNamed(AppRoutes.profileTabScreen);
                      },
                    ),
                    ListTile(
                      title: Center(
                        child: Text("lbl_clothing".tr.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoRegular18.copyWith(letterSpacing: 1.08)),
                      ),
                      onTap: () {
                        Get.back();
                        Get.toNamed(AppRoutes.productDiscoverScreen);
                      },
                    ),
                  ]),
            ],
          ),
          Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Padding(
                            padding: getPadding(bottom: 1),
                            child: CommonImageView(
                                svgPath: ImageConstant.imgEye, height: getSize(26.00), width: getSize(26.00)))),
                    InkWell(
                        onTap: () {},
                        child: Padding(
                            padding: getPadding(left: 24, bottom: 1),
                            child: CommonImageView(
                                svgPath: ImageConstant.imgFacebook, height: getSize(26.00), width: getSize(26.00)))),
                    InkWell(
                        onTap: () {},
                        child: Padding(
                            padding: getPadding(left: 24, top: 1),
                            child: CommonImageView(
                                svgPath: ImageConstant.imgSettings, height: getSize(26.00), width: getSize(26.00)))),
                    InkWell(
                        onTap: () {},
                        child: Padding(
                            padding: getPadding(left: 24, bottom: 1),
                            child: CommonImageView(
                                svgPath: ImageConstant.imgVector, height: getSize(26.00), width: getSize(26.00))))
                  ]),
              SizedBox(height: context.mediaQueryPadding.bottom + 12.0),
            ],
          ),
        ],
      ),
    );
  }
}
