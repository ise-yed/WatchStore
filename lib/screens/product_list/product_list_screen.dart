// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/data/model/sort_model.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/screens/product_list/bloc/product_list_bloc.dart';

import '../../component/text_style.dart';
import '../../res/colors.dart';
import '../../res/dimens.dart';
import '../../widget/app_bar.dart';
import '../../widget/cart_badge.dart';
import '../../widget/custom_loading.dart';
import '../../widget/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen(
      {super.key, required this.catTitle, required this.isActiveSort});

  final ValueNotifier<String> catTitle;
  final ValueNotifier<bool> isActiveSort;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductListBloc>(context).emit(ProductListLoading());
    super.initState();
  }

  int current = 0;
  ValueNotifier<String> sortTitle = ValueNotifier("مرتب سازی بر اساس");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CartBadge(),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0)),
                      ),
                      showDragHandle: true,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          height: 230,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20.0)),
                          ),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 4,
                            padding: const EdgeInsets.all(12),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  current = index + 1;
                                  sortTitle.value = sortList[index].title;
                                  BlocProvider.of<ProductListBloc>(context).add(
                                      ProductListSorted(
                                          sortList[index].sortRout));
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.all(AppDimens.medium),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.3, color: Colors.grey))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Transform.scale(
                                        scale: 1.3,
                                        child: CupertinoRadio(
                                          activeColor: AppColors.loadingColor,
                                          useCheckmarkStyle: true,
                                          value: sortList[index].id,
                                          groupValue: current,
                                          onChanged: (value) {
                                            current = index + 1;
                                            sortTitle.value =
                                                sortList[index].title;
                                            BlocProvider.of<ProductListBloc>(
                                                    context)
                                                .add(ProductListSorted(
                                                    sortList[index].sortRout));
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      Text(
                                        sortList[index].title,
                                        style: AppTextStyles.appBarText,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: ValueListenableBuilder(
                    valueListenable: widget.isActiveSort,
                    builder: (context, value, child) {
                      return widget.isActiveSort.value
                          ? Row(
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: sortTitle,
                                  builder: (BuildContext context, String value,
                                      Widget? child) {
                                    return Text(
                                      sortTitle.value,
                                      style: AppTextStyles.avatarText,
                                    );
                                  },
                                ),
                                AppDimens.small.width,
                                SvgPicture.asset(
                                  Assets.svg.sort.path,
                                  height: 25,
                                ),
                              ],
                            )
                          : ValueListenableBuilder(
                              valueListenable: widget.catTitle,
                              builder: (context, value, child) => Text(
                                "نتایج بر اساس: ${widget.catTitle.value}",
                                style: AppTextStyles.searchHint
                                    .copyWith(fontSize: 14),
                              ),
                            );
                    },
                  )),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(Assets.svg.close.path),
                splashRadius: 0.1,
              )
            ],
          ),
        ),
        body: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            if (state is ProductListSuccess) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        AppDimens.medium, AppDimens.medium, AppDimens.large, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios_new,
                          size: 16,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                          "جستجو بر اساس برند",
                          style:
                              AppTextStyles.primaryStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimens.medium,
                        horizontal: AppDimens.small),
                    child: SizedBox(
                      height: 60,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.brandList.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              widget.catTitle.value =
                                  state.brandList[index].title;
                              widget.isActiveSort.value = false;
                              BlocProvider.of<ProductListBloc>(context).add(
                                  ProductListByBrand(
                                      state.brandList[index].id));
                            },
                            child: Container(
                              width: 100,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.small * .6),
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.small + 2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.medium),
                                gradient: const LinearGradient(
                                  colors: AppColors.catColors,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child:
                                  Image.network(state.brandList[index].image),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Divider(
                    indent: MediaQuery.sizeOf(context).width * .09,
                    endIndent: MediaQuery.sizeOf(context).width * .09,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.productList.length,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2,
                              childAspectRatio: 0.62),
                      itemBuilder: (context, index) => ProductItem(
                          id: state.productList[index].id,
                          image: state.productList[index].image,
                          productName: state.productList[index].title,
                          price:
                              "${state.productList[index].price.separateWithComma} تومان",
                          discount: state.productList[index].discount,
                          oldPrice: state.productList[index].discountPrice
                              .separateWithComma,
                          specialExpiration:
                              state.productList[index].specialExpiration),
                    ),
                  ),
                ],
              );
            } else if (state is ProductListError) {
              return Center(
                  child: Text(
                state.error,
                style: AppTextStyles.error,
              ));
            } else {
              return const CustomLoading();
            }
          },
        ),
      ),
    );
  }
}
