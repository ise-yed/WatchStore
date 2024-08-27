import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/res/colors.dart';

import '../component/text_style.dart';

class BtmNavItem extends StatelessWidget {
  final String iconPath;
  final String text;
  final bool isActive;
  final void Function() onTap;

  const BtmNavItem(
      {super.key,
      required this.iconPath,
      required this.text,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        width: 50 ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                  isActive
                      ? AppColors.btmNavActiveItem
                      : AppColors.btmNavInActiveItem,
                  BlendMode.srcIn),
            ),
            6.height,
            Text(
              text,
              style: isActive?AppTextStyles.btmNavActiveItem:AppTextStyles.btmNavInActiveItem,
            ),
          ],
        ),
      ),
    );
  }
}
