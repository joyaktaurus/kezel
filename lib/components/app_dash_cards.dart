import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DashBoardCards extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double? widthh;
  final double? heightt;
  final Scale;
  final Color? color;

//  final String svg;
//  final String? image;
  final GestureTapCallback? onTap;

  const DashBoardCards({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
    // required this.svg,
    // this.image,
    this.widthh, this.heightt, this.Scale, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
              blurRadius: 10,
            ),
          ],
          color: Colors.blue[800],
        ),
        height: height,
        width: width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(image!,
              //   width: widthh, height: heightt, scale: Scale,color: color,
              //   ),
              SizedBox(height: Get.height * 0.01),
              Text(
                text.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
