import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  final text;
  final maxline;
  final textalign;
  final color;
  final size;
  final fontWidth;
  const Text1(
      {super.key,
      this.text,
      this.maxline,
      this.textalign,
      this.color,
      this.size,
      this.fontWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Text(
        text ?? ' ',
        maxLines: maxline ?? 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textalign ?? TextAlign.center,
        style: TextStyle(
            color: color ?? Colors.white,
            fontSize: size ?? 18,
            fontWeight: fontWidth ?? FontWeight.w500),
      ),
    );
  }
}
