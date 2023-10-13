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
    this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
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
          hintText: widget.hintText ?? "msg_enter_your_pass".tr,
          enabledBorder: border,
          contentPadding: EdgeInsets.zero,
          helperText: '',
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
          padding: EdgeInsets.zero,
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
      padding: EdgeInsets.zero,
      splashRadius: 10,
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
    this.hintText,
    this.iconData = Icons.mail,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String? hintText;
  final IconData? iconData;
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
        hintText: hintText ?? "msg_enter_your_emai".tr,
        contentPadding:iconData == null ?  EdgeInsets.symmetric(horizontal: 12.0): EdgeInsets.zero,
        helperText: '',
        prefixIcon: iconData != null
            ? IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 16.0),
                    Icon(iconData ?? Icons.mail, color: lightWhite),
                    const SizedBox(width: 12.0),
                    const VerticalDivider(indent: 10, endIndent: 10),
                    const SizedBox(width: 12.0),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
