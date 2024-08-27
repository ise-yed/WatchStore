// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:watch_store/component/button_style.dart';

class MainButton extends StatelessWidget {

  final Widget child;
  void Function()? onPressed;

  MainButton({super.key, required this.child,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.sizeOf(context);
    return SizedBox(
      height:size.height*.07,
      width: size.width*.75,
      child: ElevatedButton(
        style: AppButtonStyle.mainButtonStyle,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
