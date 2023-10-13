import 'controller/profile_security_controller.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';
import 'package:shopsie/core/utils/validation_functions.dart';
import 'package:shopsie/widgets/custom_button.dart';
import 'package:shopsie/widgets/custom_text_form_field.dart';

class ProfileSecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileSecurityController>(builder: (controller) {
      return SingleChildScrollView(
          child: Container(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(right: 10),
                        child: Text("lbl_change_password".tr.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoSemiBold13.copyWith())),
                    Padding(
                        padding: getPadding(top: 26, right: 10),
                        child: Text("msg_current_passwor".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoMedium13.copyWith())),
                    CustomTextFormField(
                        width: 358,
                        focusNode: FocusNode(),
                        controller: controller.currentPasswordController,
                        hintText: "lbl_password".tr,
                        margin: getMargin(top: 15),
                        validator: (value) {
                          if (value == null ||
                              (!isValidPassword(value, isRequired: true))) {
                            return "Please enter valid password";
                          }
                          return null;
                        },
                        isObscureText: true),
                    Padding(
                        padding: getPadding(top: 27, right: 10),
                        child: Text("lbl_new_password".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoMedium13.copyWith())),
                    CustomTextFormField(
                        width: 358,
                        focusNode: FocusNode(),
                        controller: controller.newPasswordOneController,
                        hintText: "lbl_new_password2".tr,
                        margin: getMargin(top: 15),
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null ||
                              (!isValidPassword(value, isRequired: true))) {
                            return "Please enter valid password";
                          }
                          return null;
                        },
                        isObscureText: true),
                    CustomButton(
                        width: 358,
                        text: "lbl_update_password".tr.toUpperCase(),
                        margin: getMargin(top: 24),
                        variant: ButtonVariant.FillGray300,
                        padding: ButtonPadding.PaddingAll13,
                        onTap: onTapBtnUpdatepassword)
                  ])));
    });
  }

  void onTapBtnUpdatepassword() {
    // PostMeReq postMeReq = PostMeReq(
    //   password: controller.newPasswordOneController.text,
    // );
    // controller.callCreateMe(
    //   postMeReq.toJson(),
    //   successCall: _onCreateMeSuccess,
    //   errCall: _onCreateMeError,
    // );
  }

}
