import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/data/model/slide_model.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';

import '../res/colors.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({
    super.key,
    required this.imgList,
  });

  final List<SlideModel> imgList;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  final CarouselController _controller = CarouselController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 170,
            enlargeCenterPage: false,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.imgList
              .map((e) => Container(
                    margin: const EdgeInsets.only(
                        left: AppDimens.small, right: AppDimens.small),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                        imageUrl: e.image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: AppColors.loadingColor,
                            size: 30,
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Image.asset(Assets.png.mainLogo.path),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        Positioned(
            bottom: 7,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imgList
                    .asMap()
                    .entries
                    .map((e) => Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 3),
                          child: GestureDetector(
                            onTap: () => _controller.animateToPage(e.key),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: _current == e.key
                                  ? AppDimens.large - 4
                                  : AppDimens.medium,
                              height: AppDimens.small,
                              decoration: BoxDecoration(
                                  //shape: BoxShape.circle,
                                  //border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30),
                                  color: _current == e.key
                                      ? AppColors.continueShopping
                                      : Colors.white),
                            ),
                          ),
                        ))
                    .toList())),
      ],
    );
  }
}
