import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  VoidCallback function;
  double width;
  String txt;
  Color background;
  Color txtcolor;
  double borderraduis;
  Color bordercolor;
  double height;

  AddButton(
      {Key? key,
      required this.function,
      this.width = double.infinity,
      this.txt = 'Add task',
      this.background = Colors.green,
      this.txtcolor = Colors.white,
      this.borderraduis = 10,
      this.bordercolor = Colors.transparent,
      this.height = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderraduis),
        borderSide: BorderSide(color: bordercolor),
      ),
      color: background,
      height: height,
      onPressed: function,
      minWidth: width,
      child: Text(
        txt,
        style: TextStyle(color: txtcolor),
      ),
    );
  }
}
