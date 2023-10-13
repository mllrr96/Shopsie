import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'color_constant.dart';

class ProgressDialogUtils {
  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false, String? status}) async {
    if (EasyLoading.isShow) return;
    EasyLoading.show(
        status: status,
        maskType: isCancellable ? null : EasyLoadingMaskType.black,
        indicator: LoadingAnimationWidget.beat(color: ColorConstant.indigoA200, size: 50));
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    EasyLoading.dismiss();
  }
}
