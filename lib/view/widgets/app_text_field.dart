import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.maxLines,
    this.controller,
  });
  final String label;
  final int? maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final border = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
    return TextField(
      controller: controller,
      maxLines: maxLines,
      cursorColor: Colors.white,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 0, bottom: 14),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 14,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w400,
          height: 0.2,
        ),
        border: border,
        focusedBorder: border,
        enabledBorder: border,
      ),
    );
  }
}
