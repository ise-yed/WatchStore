import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/screens/product_list/product_list_screen.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/colors.dart';
import '../res/dimens.dart';
import '../res/strings.dart';
import '../screens/product_list/bloc/product_list_bloc.dart';

class SearchBtn extends StatelessWidget {
  SearchBtn({
    super.key,
  });

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.medium),
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: TextField(
          controller: searchController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.large),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.large),
                borderSide: const BorderSide(color: AppColors.primaryColor)),
            prefixIcon: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                BlocProvider.of<ProductListBloc>(context).add(
                    ProductListBySearch(searchController.text.toUpperCase()));

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductListScreen(
                        catTitle: ValueNotifier(searchController.text == ""
                            ? "همه محصولات"
                            : searchController.text,),
                        isActiveSort:
                            ValueNotifier(searchController.text == "" ? true : false,)
                        //screenKey: 'search',
                        //searchKey: searchController.text.toUpperCase(),
                      ),
                    ));
              },
              icon: SvgPicture.asset(
                Assets.svg.search.path,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(Assets.png.mainLogo.path),
            ),
            hintText: AppStrings.searchProduct,
            hintStyle: AppTextStyles.searchHint,
          ),
        ),
      ),
    );
  }
}
