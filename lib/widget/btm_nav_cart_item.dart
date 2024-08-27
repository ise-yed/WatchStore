import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/data/repo/cart_repo.dart';
import 'package:watch_store/res/colors.dart';

import '../component/text_style.dart';

class BtmNavCartItem extends StatelessWidget {
  final String iconPath;
  final String text;
  final bool isActive;
  final void Function() onTap;

  const BtmNavCartItem(
      {super.key,
      required this.iconPath,
      required this.text,
      required this.isActive,
      required this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            width: 50 ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                      isActive
                          ? AppColors.btmNavActiveItem
                          : AppColors.btmNavInActiveItem,
                      BlendMode.srcIn),
                ),
                8.height,
                Text(
                  text,
                  style: isActive?AppTextStyles.btmNavActiveItem:AppTextStyles.btmNavInActiveItem,
                ),
              ],
            ),
          ),
          ValueListenableBuilder(valueListenable: cartRepository.cartCount, builder: (context, value, child) {
            return Visibility(
              visible: cartRepository.cartCount.value > 0 ? true : false,
              child: Positioned(
                top: 11,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: Text(
                    cartRepository.cartCount.value.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),),);
          },)
        ],
      ),
    );
  }
}