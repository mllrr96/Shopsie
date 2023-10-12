import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopsie/widgets/search_text_field.dart';

import '../product_search_screen/widgets/product_search_item_widget.dart';
import 'controller/product_search_controller.dart';
import 'models/product_search_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopsie/core/app_export.dart';

class ProductSearchScreen extends GetWidget<ProductSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  IconButton(onPressed: ()=> Get.back(), icon: SvgPicture.asset(ImageConstant.imgArrowleft), splashRadius: 25,),
                  Flexible(
                    child: SearchTextField(
                      onChanged: controller.searchProduct,
                      controller: controller.appbarController,
                      hintText: "lbl_search".tr,
                      fillColor: ColorConstant.gray50,
                      autoFocus: true,
                    ),
                  ),
                ],
              ),
            )),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Obx(
          () => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: getPadding(left: 16, top: 22, right: 16),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: getVerticalSize(309.00),
                            crossAxisCount: 2,
                            mainAxisSpacing: getHorizontalSize(16.00),
                            crossAxisSpacing: getHorizontalSize(16.00)),
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.productSearchModelObj.value.productSearchItemList.length,
                        itemBuilder: (context, index) {
                          ProductSearchItemModel model =
                              controller.productSearchModelObj.value.productSearchItemList[index];
                          return ProductSearchItemWidget(model, onTapColumnproductname: () {
                            Get.toNamed(AppRoutes.productPageScreen, arguments: {
                              NavigationArgs.productId:
                                  controller.productSearchModelObj.value.productSearchItemList.value[index].idTxt
                            });
                          });
                        }))
              ]),
        ))));
  }
}
