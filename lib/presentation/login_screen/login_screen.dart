import 'package:flutter/services.dart';
import 'package:shopsie/widgets/sign_in_text_fields.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';

class LoginScreen extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    final bottomPadding = context.mediaQueryPadding.bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.theme.appBarTheme.systemOverlayStyle!,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          bottomNavigationBar: bottomNavWidget(bottomPadding),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Image.asset('assets/images/medusa.png', scale: 4),
                      ),
                      Container(
                          child: Text("msg_welcome_back_g".tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoBold24.copyWith(letterSpacing: 0.72, height: 1.46))),
                      Column(
                        children: [
                          space,
                          EmailTextField(
                            controller: controller.emailController,
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
                          space,
                          PasswordTextField(
                            controller: controller.passwordController,
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
                          space,
                          ElevatedButton(
                            child: Text(
                              "lbl_login".tr,
                              style: TextStyle(
                                color: ColorConstant.whiteA700,
                                fontSize: getFontSize(16),
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(Get.width, 40), backgroundColor: ColorConstant.indigoA200),
                            onPressed: controller.onLoginTap,
                          ),
                          space,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(height: 2, decoration: BoxDecoration(color: ColorConstant.indigo50)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text("lbl_or_login_with".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtLatoRegular14Gray602.copyWith()),
                                ),
                                Expanded(
                                  child: Container(height: 2, decoration: BoxDecoration(color: ColorConstant.indigo50)),
                                )
                              ]),
                          space,
                          Column(
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                child: SignInButton(
                                  Buttons.facebook,
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: SignInButton(
                                  Buttons.google,
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
            onTap: () {
              Get.offNamed(AppRoutes.registerScreen);
            },
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "lbl_don_t_have_an".tr, style: textStyle),
                  TextSpan(text: "lbl_account".tr, style: textStyle),
                  TextSpan(text: ' ', style: textStyle),
                  TextSpan(
                      text: "lbl_register_now".tr,
                      style: textStyle.copyWith(color: ColorConstant.indigoA200, fontWeight: FontWeight.w600)),
                ])))),
        SizedBox(height: bottomPadding),
      ],
    );
  }
}
