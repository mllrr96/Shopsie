import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/color_constant.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(4)));
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.done,
      style: mediumTextStyle,
      validator: widget.validator,
      maxLines: 1,
      cursorColor: lightWhite,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstant.gray50,
          border: border,
          hintText: "msg_enter_your_pass".tr,
          enabledBorder: border,
          contentPadding: EdgeInsets.zero,
          prefixIcon: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 16.0),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, anim) => FadeTransition(
                          opacity: child.key == const ValueKey('icon1')
                              ? Tween<double>(begin: 1, end: 1).animate(anim)
                              : Tween<double>(begin: 1, end: 1).animate(anim),
                          child: FadeTransition(opacity: anim, child: child),
                        ),
                    child: obscureText
                        ? Icon(Icons.lock, key: const ValueKey('icon1'), color: lightWhite)
                        : Icon(
                            Icons.lock_open,
                            color: lightWhite,
                            key: const ValueKey('icon2'),
                          )),
                const SizedBox(width: 12.0),
                const VerticalDivider(indent: 10, endIndent: 10),
                const SizedBox(width: 12.0),
              ],
            ),
          ),
          suffixIcon: iconButton()),
    );
  }

  Widget iconButton() {
    if (GetPlatform.isIOS) {
      return CupertinoButton(
          child: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          });
    }
    return IconButton(
      onPressed: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      icon: Icon(
        obscureText ? Icons.visibility : Icons.visibility_off,
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction = TextInputAction.next,
    this.validator,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(4)));
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      textInputAction: textInputAction,
      style: mediumTextStyle,
      validator: validator,
      decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstant.gray50,
          border: border,
          enabledBorder: border,
          hintText: "msg_enter_your_emai".tr,
          contentPadding: EdgeInsets.zero,
          prefixIcon: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 16.0),
                Icon(Icons.mail, color: lightWhite),
                const SizedBox(width: 12.0),
                const VerticalDivider(indent: 10, endIndent: 10),
                const SizedBox(width: 12.0),
              ],
            ),
          )),
    );
  }
}
