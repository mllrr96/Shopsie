import '/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/data/apiClient/api_client.dart';
import 'package:medusa_flutter/medusa_flutter.dart';
class ProductPageController extends GetxController {

  Product product = Get.arguments;


  // PostCartIdLineItemsResp postCartIdLineItemsResp = PostCartIdLineItemsResp();

  @override
  void onReady() {
    super.onReady();
    // this.callFetchId(
    //   successCall: _onFetchIdSuccess,
    //   errCall: _onFetchIdError,
    //   id: productId.value,
    // );
  }

  @override
  void onClose() {
    super.onClose();
  }

  void callFetchId(
      {VoidCallback? successCall, VoidCallback? errCall, String? id}) async {
    return Get.find<ApiClient>().fetchId(
        onSuccess: (resp) {
          onFetchIdSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onFetchIdError(err);
          if (errCall != null) {
            errCall();
          }
        },
        id: id);
  }

  void onFetchIdSuccess(var response) {
    // getIdResp = GetIdResp.fromJson(response);
  }

  void onFetchIdError(var err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
        messageText: Text(
          '$err',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
  void callCreateCartIdLineItems(Map req,
      {VoidCallback? successCall,
      VoidCallback? errCall,
      String? cartId}) async {
    return Get.find<ApiClient>().createCartIdLineItems(
        onSuccess: (resp) {
          onCreateCartIdLineItemsSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateCartIdLineItemsError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req,
        cartId: cartId);
  }

  void onCreateCartIdLineItemsSuccess(var response) {
    // postCartIdLineItemsResp = PostCartIdLineItemsResp.fromJson(response);
  }

  void onCreateCartIdLineItemsError(var err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
        messageText: Text(
          '$err',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
