import 'package:flutter/material.dart';
import 'package:foodloop/views/utils/AppColor.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final bool obsecureText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  CustomTextField({
    required this.title,
    required this.hint,
    this.controller,
    this.obsecureText = false,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              '$title',
              style: TextStyle(
                  //form subtitle
                  color: Color.fromRGBO(151, 150, 161, 1),
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
