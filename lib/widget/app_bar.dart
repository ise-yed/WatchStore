import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.child});

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return PreferredSize(
      preferredSize: Size(size.width, size.height * .07),
      child: Container(
        height: size.height * .07,
        decoration: const BoxDecoration(
            color: AppColors.appbar,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadow, offset: Offset(0, 2), blurRadius: 3)
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppDimens.medium),
              bottomRight: Radius.circular(AppDimens.medium),
            )),
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppDimens.medium, right: AppDimens.medium),
          child: child,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
