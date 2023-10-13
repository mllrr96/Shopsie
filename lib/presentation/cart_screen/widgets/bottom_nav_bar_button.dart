import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/color_constant.dart';

class BottomNavigationBarButton extends StatelessWidget {
  const BottomNavigationBarButton({
    Key? key,
    required this.onPress,
    required this.label,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
    this.buttonColor,
    this.buttonWidth,
    this.noShadow = false,
    this.containerHeight,
  }) : super(key: key);
  final void Function()? onPress;
  final String label;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? buttonColor;
  final double? buttonWidth;
  final double? containerHeight;
  final bool noShadow;
  @override
  Widget build(BuildContext context) {
    final TextStyle filledTextStyle = TextStyle(
      color: ColorConstant.whiteA700,
      fontSize: 13,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w600,
    );
    const EdgeInsets kBackgroundButtonPadding = EdgeInsets.symmetric(vertical: 14.0, horizontal: 64.0);
    const double kContainerHeight = 50.0;
    final bottomPadding = context.mediaQueryPadding.bottom;
    final defaultBackgroundColor = context.theme.bottomNavigationBarTheme.backgroundColor;
    // final BoxShadow boxShadow = BoxShadow(
    //   color: Colors.grey.withOpacity(0.5),
    //   spreadRadius: 3,
    //   blurRadius: 7,
    //   offset: const Offset(0, 0),
    // );
    if (GetPlatform.isIOS) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(color: backgroundColor ?? defaultBackgroundColor, height: bottomPadding / 2),
          Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? defaultBackgroundColor,
              // boxShadow: noShadow ? null : [boxShadow],
            ),
            height: containerHeight ?? kContainerHeight,
            alignment: Alignment.center,
            child: CupertinoTheme(
              data: CupertinoThemeData(primaryColor: buttonColor ?? ColorConstant.indigoA200),
              child: SizedBox(
                width: buttonWidth,
                child: CupertinoButton.filled(
                  onPressed: onPress,
                  child: Text(
                    label,
                    style: textStyle ?? filledTextStyle,
                  ),
                ),
              ),
            ),
          ),
          Container(color: backgroundColor ?? defaultBackgroundColor, height: bottomPadding),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(color: backgroundColor ?? defaultBackgroundColor, height: bottomPadding / 2),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? defaultBackgroundColor,
            // boxShadow:noShadow ? null : [boxShadow],
          ),
          height: containerHeight ?? kContainerHeight,
          alignment: Alignment.center,
          child: MaterialButton(
            padding: kBackgroundButtonPadding,
            minWidth: buttonWidth,
            color: buttonColor ?? Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: onPress,
            child: Text(
              label,
              style: textStyle ?? filledTextStyle,
            ),
          ),
        ),
        Container(color: backgroundColor ?? defaultBackgroundColor, height: bottomPadding),
      ],
    );
  }
}
