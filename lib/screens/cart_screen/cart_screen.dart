import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/data/model/cart_model.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:watch_store/screens/profile/bloc/profile_bloc.dart';
import 'package:watch_store/widget/app_bar.dart';

import '../../component/button_style.dart';
import '../../widget/custom_loading.dart';
import '../../widget/shopping_cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(CartInitEvent());
    BlocProvider.of<ProfileBloc>(context).add(ProfileAddressEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context).add(CartInitEvent());
                    BlocProvider.of<CartBloc>(context)
                        .add(CartCountItemEvent());
                  },
                  icon: const Icon(CupertinoIcons.refresh),
                ),
                const Text(
                  AppStrings.basket,
                  style: AppTextStyles.appBarText,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: size.height * .115,
              width: double.infinity,
              margin: const EdgeInsets.only(
                  top: AppDimens.medium, bottom: AppDimens.small),
              padding: const EdgeInsets.all(AppDimens.medium),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0, 2),
                    blurRadius: 4)
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.sendToAddress,
                    style: AppTextStyles.productCaption,
                  ),
                  AppDimens.small.height,
                  BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (previous, current) {
                      if (current is ProfileAddressLoading ||
                          current is ProfileAddressError ||
                          current is ProfileAddressSuccess) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                    builder: (profileContext, profileState) {
                      if (profileState is ProfileAddressLoading ||
                          profileState is ProfileLoading) {
                        return const LinearProgressIndicator();
                      } else if (profileState is ProfileAddressSuccess) {
                        return Text(
                          profileState.addressModel.address!,
                          style: AppTextStyles.avatarText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                        );
                      } else if (profileState is ProfileAddressError) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              profileState.error,
                              maxLines: 3,
                              style: AppTextStyles.error,
                            ),
                            AppDimens.medium.width,
                            Icon(
                              CupertinoIcons.exclamationmark_circle,
                              color: Colors.red.shade400,
                            ),
                          ],
                        );
                      } else {
                        throw Exception("Invalid $profileState State");
                      }
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<CartBloc, CartState>(
              buildWhen: (previous, current) {
                if (current is CartSuccessState ||
                    current is CartItemAddedState ||
                    current is CartItemRemoveState ||
                    current is CartItemDeleteState ||
                    current is CartLoadingState ||
                    current is CartErrorState) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (cartContext, cartState) {
                if (cartState is CartSuccessState) {
                  return CartList(
                    cartList: cartState.cartModel.userCart!,
                  );
                } else if (cartState is CartItemAddedState) {
                  return CartList(
                    cartList: cartState.cartModel.userCart!,
                  );
                } else if (cartState is CartItemRemoveState) {
                  return CartList(
                    cartList: cartState.cartModel.userCart!,
                  );
                } else if (cartState is CartItemDeleteState) {
                  return CartList(
                    cartList: cartState.cartModel.userCart!,
                  );
                } else if (cartState is CartErrorState) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'خطا در بارگذاری اطلاعات...',
                          style: AppTextStyles.error,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
                          style: AppButtonStyle.mainButtonStyle,
                          onPressed: () {
                            BlocProvider.of<CartBloc>(context)
                                .add(CartInitEvent());
                          },
                          child: const Text(
                            'تلاش مجدد',
                            style: AppTextStyles.mainButton,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Expanded(child: CustomLoading());
                }
              },
            ),
            BlocConsumer<CartBloc, CartState>(
              listener: (context, state) async {
                if (state is RecivedPaymentLinkState) {
                  final Uri url = Uri.parse(state.url);
                  if (await launchUrl(url)) {
                    debugPrint('could not launch $url');
                  }
                }
              },
              builder: (context, state) {
                CartModel? userCart;
                switch (state.runtimeType) {
                  case CartSuccessState:
                  case CartItemAddedState:
                  case CartItemRemoveState:
                  case CartItemDeleteState:
                    userCart = (state as dynamic).cartModel;
                    break;
                  case CartErrorState:
                    return Container(
                      height: 70,
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: AppColors.shadow, blurRadius: 10)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'خطا در بارگذاری اطلاعات...',
                            style: AppTextStyles.error,
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          ElevatedButton(
                            style: AppButtonStyle.mainButtonStyle,
                            onPressed: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(CartInitEvent());
                            },
                            child: const Text(
                              'تلاش مجدد',
                              style: AppTextStyles.mainButton,
                            ),
                          ),
                        ],
                      ),
                    );
                  case CartLoadingState:
                    return const SizedBox();
                  default:
                    return const SizedBox();
                }
                return Visibility(
                  visible: (userCart!.cartTotalPrice ?? 0) > 0,
                  child: Container(
                    // height: 70,
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: AppColors.shadow, blurRadius: 10)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'قیمت نهایی: ${userCart.cartTotalPrice!.separateWithComma} تومان',
                              style: AppTextStyles.productPrice,
                            ),
                            userCart.totalWithoutDiscountPrice !=
                                    userCart.cartTotalPrice
                                ? Text(
                                    'بدون تخفیف: ${userCart.totalWithoutDiscountPrice!.separateWithComma} تومان',
                                    style: AppTextStyles.primaryStyle
                                        .copyWith(fontSize: 16),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .06,
                          width: size.width * .37,
                          child: ElevatedButton(
                            style: AppButtonStyle.continueShoppingButtonStyle,
                            onPressed: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(PaymentEvent());
                            },
                            child: const Text(
                              "ادامه فرآیند خرید",
                              style: AppTextStyles.mainButton,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartList});

  final List<UserCart> cartList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: cartList.isEmpty
          ? const Center(
              child: Text(
              'سبد خرید شما خالی می باشد',
              style: AppTextStyles.loadingText,
            ))
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: AppDimens.large),
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                return ShoppingCartItem(
                  cartModel: cartList[index],
                );
              },
            ),
    );
  }
}
