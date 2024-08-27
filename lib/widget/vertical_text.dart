import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/dimens.dart';

class VerticalText extends StatelessWidget {
  const VerticalText({required this.title,required this.textStyle,super.key});

  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Transform.rotate(angle: 1.5,
                    child: SvgPicture.asset(Assets.svg.back.path)),
                AppDimens.small.width,
                const Text("مشاهده همه",style: AppTextStyles.productPrice,)
              ],
            ),
            AppDimens.small.height,
            Text(title,style: textStyle,)
          ],
        ),
      ),
    );
  }
}
