import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/data/model/cart_model.dart';
import 'package:watch_store/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:watch_store/widget/surface_container.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/colors.dart';

class ShoppingCartItem extends StatefulWidget {
  const ShoppingCartItem({super.key, required this.cartModel});

  final UserCart cartModel;

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.cartModel.product!,
                  style: AppTextStyles.productTitle,
                  textAlign: TextAlign.right,
                ),
                Text(
                  "قیمت  : ${widget.cartModel.price!.separateWithComma} تومان",
                  style: AppTextStyles.productCaption,
                ),
                Text(
                  "با تخفیف: ${widget.cartModel.discountPrice!.separateWithComma}  تومان",
                  style: AppTextStyles.productCaption
                      .copyWith(color: AppColors.primaryColor),
                ),
                const Divider(),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.cartModel.deleteLoading = true;
                          });
                          BlocProvider.of<CartBloc>(context).add(
                              DeleteFromCartEvent(
                                  int.parse(widget.cartModel.productId!)));
                        },
                        icon: SvgPicture.asset(Assets.svg.delete.path)),
                    const Expanded(child: SizedBox.shrink()),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.cartModel.countLoading = true;
                          });
                          BlocProvider.of<CartBloc>(context).add(
                              RemoveFromCartEvent(
                                  int.parse(widget.cartModel.productId!)));
                        },
                        icon: SvgPicture.asset(Assets.svg.minus.path)),
                    widget.cartModel.countLoading
                        ? LoadingAnimationWidget.discreteCircle(
                            color: AppColors.loadingColor,
                            secondRingColor: AppColors.amazingColor,
                            thirdRingColor: AppColors.newestColor,
                            size: 20,
                          )
                        : Text(
                            "${widget.cartModel.count} عدد",
                            style: AppTextStyles.productTitle,
                            textDirection: TextDirection.rtl,
                          ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.cartModel.countLoading = true;
                          });
                          BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                              int.parse(widget.cartModel.productId!)));
                        },
                        icon: SvgPicture.asset(Assets.svg.plus.path)),
                  ],
                ),
                Visibility(
                  visible: widget.cartModel.deleteLoading,
                  child: LinearProgressIndicator(
                    color: AppColors.loadingColor,
                    backgroundColor: AppColors.surfaceColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: CachedNetworkImage(
              imageUrl: widget.cartModel.image!,
              height: 120,
              placeholder: (context, url) => Center(
                child: LoadingAnimationWidget.discreteCircle(
                  color: AppColors.loadingColor,
                  secondRingColor: AppColors.amazingColor,
                  thirdRingColor: Colors.grey,
                  size: 20,
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Image.asset(
                  Assets.png.mainLogo.path,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
