import 'package:flutter/material.dart';
import 'package:vault_app/utils/color.dart';

class Button1 extends StatelessWidget {
  final text;
  final bgcolor;
  final ontap;
  final color;
  const Button1({super.key, this.text, this.bgcolor, this.ontap, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        margin: EdgeInsets.only(right: 15.0, left: 15.0),
        decoration: BoxDecoration(
            color: bgcolor ?? AppColor.secondary,
            borderRadius: BorderRadius.circular(35.0)),
        child: Text(
          text ?? 'Agree And Continue',
          style: TextStyle(
              color:color?? AppColor.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
