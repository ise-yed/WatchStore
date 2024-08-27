import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class CatWidget extends StatelessWidget {
  const CatWidget(
      {super.key,
      required this.colors,
      required this.iconPath,
      required this.title,
      required this.onTap});

  final void Function() onTap;
  final String title;
  final String iconPath;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.all(AppDimens.small),
            width: size.height * .088,
            height: size.height * .09,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors),
                borderRadius: BorderRadius.circular(AppDimens.large)),
            child: CachedNetworkImage(
              imageUrl: iconPath,
              placeholder: (context, url) => Center(
                child: LoadingAnimationWidget.discreteCircle(
                  color: AppColors.loadingColor,
                  secondRingColor: AppColors.amazingColor,
                  thirdRingColor: Colors.grey,
                  size: 20,
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Image.asset(Assets.png.mainLogo.path),
              ),
            ),

            //Image.network(iconPath),
          ),
          Text(
            title,
            style: AppTextStyles.catTitle.copyWith(fontSize: MediaQuery.sizeOf(context).width*.035),
          )
        ],
      ),
    );
  }
}
