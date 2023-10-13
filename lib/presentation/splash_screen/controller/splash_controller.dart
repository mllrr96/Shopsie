import 'package:shopsie/main.dart';
import '/core/app_export.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
    final customerId = prefs.getString('customer_id');
    // Check if there's no a customer id saved then head to login screen
    if (customerId == null) {
      Get.offNamed(AppRoutes.loginScreen);
      return;
    }

    // If customer id exist then try to authenticate the user
    final authResult = await medusa.auth.getSession();
    authResult.when((success) {
      Get.offAllNamed(AppRoutes.mainLandingScreen);
    }, (error) {
      Get.offNamed(AppRoutes.loginScreen);
    });
  }
}
