import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:watch_store/screens/product_list/product_list_screen.dart';
import 'package:watch_store/widget/cat_widget.dart';

import '../../component/text_style.dart';
import '../../widget/app_slider.dart';
import '../../widget/custom_loading.dart';
import '../../widget/product_item.dart';
import '../../widget/search_btn.dart';
import '../../widget/vertical_text.dart';
import '../product_list/bloc/product_list_bloc.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeInit());
    BlocProvider.of<CartBloc>(context).add(CartCountItemEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * .09),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.appbar,
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0, -2),
                    blurRadius: 10)
              ],
            ),
            child: SearchBtn(),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
              top: AppDimens.medium, bottom: AppDimens.large),
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const CustomLoading();
              } else if (state is HomeSuccess) {
                return Column(
                  children: [
                    AppSlider(
                      imgList: state.home.sliders,
                    ),
                    AppDimens.medium.height,
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .16,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(right: AppDimens.large),
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.home.categories.length,
                        itemBuilder: (context, index) {
                          return CatWidget(
                            colors: AppColors.catColors,
                            iconPath: state.home.categories[index].image,
                            title: state.home.categories[index].title,
                            onTap: () {
                              BlocProvider.of<ProductListBloc>(context).add(
                                  ProductListByCat(
                                      state.home.categories[index].id));

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductListScreen(
                                    //screenKey: 'category',
                                    isActiveSort: ValueNotifier(false),
                                    catTitle: ValueNotifier(
                                        state.home.categories[index].title),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    AppDimens.small.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 310,
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.home.amazingProducts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => ProductItem(
                                  id: state.home.amazingProducts[index].id,
                                  image:
                                      state.home.amazingProducts[index].image,
                                  productName:
                                      state.home.amazingProducts[index].title,
                                  price:
                                      "${state.home.amazingProducts[index].price.separateWithComma} تومان",
                                  discount: state
                                      .home.amazingProducts[index].discount,
                                  oldPrice: state.home.amazingProducts[index]
                                      .discountPrice.separateWithComma,
                                  specialExpiration: state
                                      .home
                                      .amazingProducts[index]
                                      .specialExpiration),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              BlocProvider.of<ProductListBloc>(context)
                                  .add(ProductListBySearch(""));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductListScreen(
                                      catTitle: ValueNotifier('همه محصولات'),
                                      isActiveSort: ValueNotifier(true),
                                      //catId: state.home.categories[index].id,
                                    ),
                                  ));
                            },
                            child: const VerticalText(
                              title: "شگفت انگیز",
                              textStyle: AppTextStyles.amazingProducts,
                            ),
                          )
                        ],
                      ),
                    ),
                    AppDimens.small.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 320,
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.home.mostSellerProducts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => ProductItem(
                                  id: state.home.mostSellerProducts[index].id,
                                  image: state
                                      .home.mostSellerProducts[index].image,
                                  productName: state
                                      .home.mostSellerProducts[index].title,
                                  price:
                                      "${state.home.mostSellerProducts[index].price.separateWithComma} تومان",
                                  discount: state
                                      .home.mostSellerProducts[index].discount,
                                  oldPrice: state.home.mostSellerProducts[index]
                                      .discountPrice.separateWithComma,
                                  specialExpiration: state
                                      .home
                                      .mostSellerProducts[index]
                                      .specialExpiration),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              BlocProvider.of<ProductListBloc>(context)
                                  .add(ProductListBySearch(""));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductListScreen(
                                      catTitle: ValueNotifier('همه محصولات'),
                                      isActiveSort: ValueNotifier(true),
                                      //catId: state.home.categories[index].id,
                                    ),
                                  ));
                            },
                            child: const VerticalText(
                              title: "پرفروش ها",
                              textStyle: AppTextStyles.bestSellersProducts,
                            ),
                          )
                        ],
                      ),
                    ),
                    AppDimens.small.height,
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(Assets.png.banner.path),
                    ),

                    AppDimens.small.height,
                    //AppDimens.small.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 320,
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.home.newestProducts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => ProductItem(
                                  id: state.home.newestProducts[index].id,
                                  image: state.home.newestProducts[index].image,
                                  productName:
                                      state.home.newestProducts[index].title,
                                  price:
                                      "${state.home.newestProducts[index].price.separateWithComma} تومان",
                                  discount:
                                      state.home.newestProducts[index].discount,
                                  oldPrice: state.home.newestProducts[index]
                                      .discountPrice.separateWithComma,
                                  specialExpiration: state.home
                                      .newestProducts[index].specialExpiration),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              BlocProvider.of<ProductListBloc>(context)
                                  .add(ProductListBySearch(""));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductListScreen(
                                      catTitle: ValueNotifier('همه محصولات'),
                                      isActiveSort: ValueNotifier(true),
                                      //catId: state.home.categories[index].id,
                                    ),
                                  ));
                            },
                            child: const VerticalText(
                              title: "جدیدترین ها",
                              textStyle: AppTextStyles.newestProducts,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is HomeError) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.error,
                      style: AppTextStyles.error,
                    ),
                    AppDimens.medium.width,
                    Icon(
                      CupertinoIcons.wifi_slash,
                      color: Colors.red.shade400,
                    ),
                  ],
                );
              } else {
                throw Exception("Invalid Home State");
              }
            },
          ),
        ),
      ),
    );
  }
}
