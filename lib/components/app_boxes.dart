import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class AppBoxes extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;

  const AppBoxes({
    Key? key,
     this.width,
     this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20, right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
        child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(
                      2, 0), // changes position of shadow
                )
              ],
              color: Colors.white,
            ),
            height: height,
            width: width,
            child: child
        ),
      ),
    );
  }
}
