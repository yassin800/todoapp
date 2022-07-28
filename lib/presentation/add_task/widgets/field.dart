import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  TextEditingController controller;
  String txt;
  Icon? suffix;
  Field({
    Key? key,
    required this.controller,
    required this.txt,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffix,
        hintText: txt,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
