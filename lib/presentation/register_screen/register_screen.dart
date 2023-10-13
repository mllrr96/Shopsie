import 'package:shopsie/main.dart';
import 'package:shopsie/widgets/sign_in_text_fields.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    const halfSpace = SizedBox(height: 6.0);
    final bottomPadding = context.mediaQueryPadding.bottom;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        bottomNavigationBar: bottomNavWidget(bottomPadding),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Text("msg_hello_register".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoBold24.copyWith(letterSpacing: 0.72, height: 1.00)),
                    ),
                    halfSpace,
                    EmailTextField(
                      controller: controller.emailController1,
                      hintText: "lbl_first_name".tr,
                      iconData: null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First name is required';
                        }
                        return null;
                      },
                    ),
                    halfSpace,
                    EmailTextField(
                      controller: controller.emailController1,
                      hintText: "lbl_last_name".tr,
                      iconData: null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Last name is required';
                        }
                        return null;
                      },
                    ),
                    halfSpace,
                    EmailTextField(
                      controller: controller.emailController1,
                      hintText: "lbl_email".tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!value.isEmail) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    ),
                    halfSpace,
                    PasswordTextField(
                      controller: controller.passwordController1,
                      hintText: "lbl_password".tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 8) {
                          return 'Password should be at least 8 characters long';
                        }
                        return null;
                      },
                    ),
                    halfSpace,
                    ElevatedButton(
                      child: Text(
                        "lbl_register".tr,
                        style: TextStyle(
                          color: ColorConstant.whiteA700,
                          fontSize: getFontSize(16),
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width, 40), backgroundColor: ColorConstant.indigoA200),
                      onPressed: onTapBtnRegister,
                    ),
                    halfSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(height: 2, decoration: BoxDecoration(color: ColorConstant.indigo50)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text("lbl_or_signup_with".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLatoRegular14Gray602.copyWith()),
                            ),
                            Expanded(
                              child: Container(height: 2, decoration: BoxDecoration(color: ColorConstant.indigo50)),
                            )
                          ]),
                    ),
                    halfSpace,
                    Column(
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: SignInButton(
                            Buttons.facebook,
                            onPressed: () {},
                            text: 'Sign up with Facebook',
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: SignInButton(
                            Buttons.google,
                            onPressed: () {},
                            text: 'Sign up with Google',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavWidget(double bottomPadding) {
    final textStyle = TextStyle(
        color: ColorConstant.gray900, fontSize: getFontSize(14), fontFamily: 'Lato', fontWeight: FontWeight.w400);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
            onTap: () => Get.offNamed(AppRoutes.loginScreen),
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: "msg_already_have_an2".tr, style: textStyle),
                      TextSpan(text: ' ', style: textStyle),
                      TextSpan(
                          text: "lbl_login_now".tr,
                          style: textStyle.copyWith(color: ColorConstant.indigoA200, fontWeight: FontWeight.w600))
                    ]),
                    textAlign: TextAlign.left))),
        SizedBox(height: bottomPadding),
      ],
    );
  }

  Future<void> onTapBtnRegister() async {
    if (!controller.formKey.currentState!.validate()) return;
    // PostCustomersReq postCustomersReq = PostCustomersReq(
    //   email: controller.emailController1.text,
    //   firstName: controller.firstNameController.text,
    //   lastName: controller.lastNameController.text,
    //   password: controller.passwordController1.text,
    // );

    await medusa.auth.authenticate();

    // controller.callFetchEmail(
    //     successCall: () {
    //       if (!controller.getEmailResp.exists) {
    //         controller.callCreateCustomers(
    //           postCustomersReq.toJson(),
    //           successCall: _onCreateCustomersSuccess,
    //           errCall: _onCreateCustomersError,
    //         );
    //       } else {
    //         Fluttertoast.showToast(
    //           msg: "Email already registered!",
    //         );
    //       }
    //     },
    //     errCall: _onEmailError,
    //     email: postCustomersReq.email);
  }

  onTapTxtAlreadyhavean() {
    Get.offNamed(AppRoutes.loginScreen);
  }

  onErrorFirebaseFacebookResponse() {
    Fluttertoast.showToast(
      msg: "Connection timeout!",
    );
  }

  onErrorFirebaseGoogleResponse() {
    Fluttertoast.showToast(
      msg: "Connection timeout!",
    );
  }

}
