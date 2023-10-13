import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopsie/core/app_export.dart';
import 'package:shopsie/main.dart';
import 'package:sign_in_button/sign_in_button.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer(this.controller);

  final MenuController controller;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppStyle.txtLatoRegular18.copyWith(letterSpacing: 1.08);
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
                      title: Text("lbl_cart".tr.toUpperCase(),
                          overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: textStyle),
                      onTap: () {
                        Get.back();
                        Get.toNamed(AppRoutes.cartScreen);
                      },
                    ),
                    ListTile(
                      title: Text("lbl_profile".tr.toUpperCase(),
                          overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: textStyle),
                      onTap: () {
                        Get.back();
                        Get.toNamed(AppRoutes.profileTabScreen);
                      },
                    ),
                    ListTile(
                      title: Text("lbl_clothing".tr.toUpperCase(),
                          overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: textStyle),
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
              ListTile(
                title: Text(
                  "lbl_logout2".tr.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(color: Colors.redAccent),
                ),
                onTap: () async {
                  final result = await medusa.auth.deleteSession();
                  if (result) {
                    PrefUtils.clearPreferencesData();
                    Get.offAllNamed(AppRoutes.loginScreen);
                  } else {
                    Fluttertoast.showToast(msg: 'Error singing out');
                  }
                },
              ),
              Divider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SignInButtonBuilder(
                      backgroundColor: Colors.deepOrange,
                      onPressed: () {},
                      text: '',
                      mini: true,
                      shape: StadiumBorder(),
                      image: SvgPicture.asset(ImageConstant.imgEye),
                    ),
                    SignInButton(
                      Buttons.facebook,
                      onPressed: () {},
                      mini: true,
                      elevation: 0,
                      shape: StadiumBorder(),
                    ),
                    SignInButton(
                      Buttons.pinterest,
                      onPressed: () {},
                      mini: true,
                      elevation: 0,
                      shape: StadiumBorder(),
                    ),
                    SignInButton(
                      Buttons.twitter,
                      onPressed: () {},
                      mini: true,
                      elevation: 0,
                      shape: StadiumBorder(),
                    ),
                  ]),
              SizedBox(height: context.mediaQueryPadding.bottom + 12.0),
            ],
          ),
        ],
      ),
    );
  }
}
