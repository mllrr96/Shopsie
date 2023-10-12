import 'package:flutter/services.dart';
import 'package:shopsie/core/constants/shopsie.dart';
import 'package:shopsie/data/models/carts/post_carts_req.dart';
import 'package:shopsie/data/models/customers/post_customers_req.dart';
import 'package:shopsie/data/models/socialAuth/soicalAuth.dart';
import 'package:shopsie/widgets/sign_in_text_fields.dart';
import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';
import 'package:shopsie/data/models/storeAuth/post_store_auth_req.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.theme.appBarTheme.systemOverlayStyle!,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    space,
                    Container(
                        child: Text("msg_welcome_back_g".tr,
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoBold24.copyWith(letterSpacing: 0.72, height: 1.46))),
                    space,
                    EmailTextField(
                      controller: controller.emailController,
                    ),
                    space,
                    PasswordTextField(controller: controller.passwordController),
                    space,
                    ElevatedButton(
                      child: Text(
                        "lbl_login".tr,
                        style: TextStyle(
                          color: ColorConstant.whiteA700,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(fixedSize: Size(Get.width, 40)),
                      onPressed: onTapBtnLogin,
                    ),
                    space,
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(top: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                        height: getVerticalSize(1.00),
                                        width: getHorizontalSize(112.00),
                                        margin: getMargin(top: 4, bottom: 10),
                                        decoration: BoxDecoration(color: ColorConstant.indigo50)),
                                    Text("lbl_or_login_with".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLatoRegular14Gray602.copyWith()),
                                    Container(
                                        height: getVerticalSize(1.00),
                                        width: getHorizontalSize(111.00),
                                        margin: getMargin(top: 4, bottom: 10),
                                        decoration: BoxDecoration(color: ColorConstant.indigo50))
                                  ])),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          // onTapStackfacebook();
                                        },
                                        child: Container(
                                            height: getVerticalSize(56.00),
                                            width: getHorizontalSize(168.00),
                                            child: Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                margin: EdgeInsets.all(0),
                                                color: ColorConstant.whiteA700,
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: ColorConstant.gray200, width: getHorizontalSize(1.00)),
                                                    borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                                child: Stack(children: [
                                                  Align(
                                                      alignment: Alignment.center,
                                                      child: Padding(
                                                          padding: getPadding(left: 40, top: 16, right: 40, bottom: 16),
                                                          child: CommonImageView(
                                                              svgPath: ImageConstant.imgFacebook24X12,
                                                              height: getVerticalSize(24.00),
                                                              width: getHorizontalSize(12.00))))
                                                ])))),
                                    InkWell(
                                        onTap: () {
                                          // onTapStackgoogle();
                                        },
                                        child: Container(
                                            height: getVerticalSize(56.00),
                                            width: getHorizontalSize(168.00),
                                            child: Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                margin: EdgeInsets.all(0),
                                                color: ColorConstant.whiteA700,
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: ColorConstant.gray200, width: getHorizontalSize(1.00)),
                                                    borderRadius: BorderRadius.circular(getHorizontalSize(8.00))),
                                                child: Stack(children: [
                                                  Align(
                                                      alignment: Alignment.center,
                                                      child: Padding(
                                                          padding: getPadding(left: 40, top: 16, right: 40, bottom: 16),
                                                          child: CommonImageView(
                                                              svgPath: ImageConstant.imgGoogle,
                                                              height: getSize(23.00),
                                                              width: getSize(23.00))))
                                                ]))))
                                  ]))
                        ]),
                    space,
                    InkWell(
                        onTap: () {
                          Get.offNamed(AppRoutes.registerScreen);
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_don_t_have_an".tr,
                                      style: TextStyle(
                                          color: ColorConstant.gray900,
                                          fontSize: getFontSize(14),
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: "lbl_account".tr,
                                      style: TextStyle(
                                          color: ColorConstant.gray900,
                                          fontSize: getFontSize(14),
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                          color: ColorConstant.gray900,
                                          fontSize: getFontSize(14),
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: "lbl_register_now".tr,
                                      style: TextStyle(
                                          color: ColorConstant.indigoA200,
                                          fontSize: getFontSize(14),
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600))
                                ]),
                                textAlign: TextAlign.left))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTapBtnLogin() {
    if (controller.formKey.currentState!.validate()) {
      PostStoreAuthReq postStoreAuthReq = PostStoreAuthReq(
        email: controller.emailController.text,
        password: controller.passwordController.text,
      );
      controller.callCreateStoreAuth(
        postStoreAuthReq.toJson(),
        successCall: _onCreateStoreAuthSuccess,
        errCall: _onCreateStoreAuthError,
      );
    }
  }

  void _onCreateStoreAuthSuccess() {
    Get.find<PrefUtils>().setCustomerId(controller.postStoreAuthResp.customer!.id!.toString());
    Get.find<PrefUtils>().setFirstName(controller.postStoreAuthResp.customer!.firstName!.toString());
    Get.find<PrefUtils>().setEmail(controller.postStoreAuthResp.customer!.email!.toString());
    Get.find<PrefUtils>().setLastName(controller.postStoreAuthResp.customer!.lastName!.toString());
    controller.callFetchCustomerId(
      successCall: _onFetchCustomerIdSuccess,
      errCall: _onFetchCustomerIdError,
      customerId: Get.find<PrefUtils>().getCustomerId(),
    );
  }

  void _onFetchCustomerIdSuccess() {
    Get.find<PrefUtils>().setCartId(controller.getCustomerIdResp.cart!.id!.toString());
    Get.offNamed(AppRoutes.mainLandingScreen);
  }

  void _onFetchCustomerIdError() {
    Fluttertoast.showToast(
      msg: "Something went wrong!",
    );
  }

  void _onCreateStoreAuthError() {
    Fluttertoast.showToast(
      msg: "Something went wrong!",
    );
  }

  _onEmailSuccess(SocialAuth authData) {
    if (controller.getEmailResp.exists) {
      PostStoreAuthReq postStoreAuthReq = PostStoreAuthReq(
        email: authData.email,
        password: Shopsie.pwd,
      );
      controller.callCreateStoreAuth(
        postStoreAuthReq.toJson(),
        successCall: _onCreateStoreAuthSuccess,
        errCall: _onCreateStoreAuthError,
      );
    } else {
      PostCustomersReq postCustomersReq = PostCustomersReq(
        email: authData.email,
        firstName: authData.firstName,
        lastName: authData.lastName,
        password: Shopsie.pwd,
      );
      controller.callCreateCustomers(
        postCustomersReq.toJson(),
        successCall: _onCreateCustomersSuccess,
        errCall: _onCreateCustomersError,
      );
    }
  }

  void _onCreateCustomersSuccess() {
    Get.find<PrefUtils>().setCustomerId(controller.postCustomersResp.customer!.id!.toString());
    Get.find<PrefUtils>().setEmail(controller.postCustomersResp.customer!.email!.toString());
    Get.find<PrefUtils>().setFirstName(controller.postCustomersResp.customer!.firstName!.toString());
    Get.find<PrefUtils>().setLastName(controller.postCustomersResp.customer!.lastName!.toString());
    PostCartsReq postCartsReq = PostCartsReq(
      regionId: Shopsie.region,
    );
    controller.callCreateCarts(
      postCartsReq.toJson(),
      successCall: _onCreateCartsSuccess,
      errCall: _onCreateCartsError,
    );
  }

  void _onCreateCartsSuccess() {
    Get.find<PrefUtils>().setCartId(controller.postCartsResp.cart!.id!.toString());
    // Get.offNamed(AppRoutes.mainLandingScreen);
    Get.offAndToNamed(AppRoutes.mainLandingScreen);
  }

  void _onCreateCartsError() {
    Fluttertoast.showToast(
      msg: "Something went wrong!",
    );
  }

  void _onCreateCustomersError() {
    Fluttertoast.showToast(
      msg: "Something went wrong!",
    );
  }
}
