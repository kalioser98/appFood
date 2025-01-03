import "package:flutter/material.dart";
import "package:foodloop/Views/utils/AppColor.dart";

class FlAppBar {
  static const String _imagePath = "assets/images/logo_small.png";
  static const Color _defaultBgColor = AppColor.primary;
  Widget? title;
  Widget? leading;
  List<Widget>? actions;
  Color? bgColor;
  NavigatorState? navState;

  FlAppBar({
    this.title,
    this.leading,
    this.actions,
    this.bgColor,
    this.navState
  }) {
    title ??= Image.asset(_imagePath);
    leading ??= IconButton(
      onPressed: () {
        if (navState != null) {
          navState!.pop();
        }
      },
      icon: const Icon(Icons.arrow_back, color: AppColor.secondary,)
    ); // Icon(Icons.arrow_back, color: AppColor.secondary);
    actions ??= [];
    bgColor ??= _defaultBgColor;
  }

  AppBar appBar() {
    return AppBar(
      title: title,
      leading: leading,
      actions: actions,
      backgroundColor: bgColor,
      centerTitle: true,
    );
  }

}