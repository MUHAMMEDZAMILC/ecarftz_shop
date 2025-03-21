// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utils/core/utils/theme/colors.dart';

class AppText extends StatelessWidget {
   AppText({
    super.key, this.googlefont,this.color,required this.text,this.size,this.letterspace,this.weight,this.family,this.textalign,this.maxline
  });
  String text;
  String? family;
  Color? color;
  double? size,letterspace;
  FontWeight? weight;
  TextStyle? googlefont;
  TextAlign? textalign;
  int? maxline=1; 

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines:maxline ,
      style: googlefont??TextStyle(
        color: color?? ColorResources.SCAFFOLDBG,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: letterspace,
        fontFamily: family??'Montserrat',
        overflow: TextOverflow.ellipsis
      ),
      textAlign:textalign?? TextAlign.start,
    );
  }
}