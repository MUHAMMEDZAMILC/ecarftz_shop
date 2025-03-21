// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
   ImageAsset({
    super.key,required this.name,this.height,this.width,this.scale,this.color
  });
  String name ='pclogo.png';
  double? width,height,scale;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/$name',width: width,height: height,scale:scale ,color:color ,);
  }
}