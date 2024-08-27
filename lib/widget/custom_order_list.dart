import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/data/model/order_model.dart';
import 'package:watch_store/widget/surface_container.dart';

import '../component/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class CustomOrderList extends StatelessWidget {
  const CustomOrderList(
      {super.key, required this.orders, required this.orderStatus});

  final List<OrderModel> orders;
  final String orderStatus;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      padding: const EdgeInsets.only(bottom: 50),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        var order = orders[index].orderDetails!;
        return SurfaceContainer(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppDimens.small),
                    decoration: BoxDecoration(
                        color: AppColors.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(AppDimens.small)),
                    child: Text(
                      orderStatus == 'Processing'
                          ? 'در حال پردازش'
                          : orderStatus == 'Cancelled'
                              ? 'لغو شده'
                              : 'تحویل شده',
                      style: AppTextStyles.productTitle.copyWith(
                          color: orderStatus == 'Processing'
                              ? Colors.blue
                              : orderStatus == 'Cancelled'
                                  ? Colors.red
                                  : Colors.green,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "کد سفارش: ${orders[index].code}",
                    style: AppTextStyles.appBarText,
                  ),
                ],
              ),
              AppDimens.medium.height,
              ListView.builder(
                itemCount: order.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: AppDimens.small),
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppDimens.medium),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.medium),
                      color: AppColors.surfaceColor,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: AppDimens.small),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.circular(AppDimens.small)),
                              child: Text(
                                '${order[index].count} عدد',
                                style: AppTextStyles.productTitle
                                    .copyWith(color: Colors.white),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            AppDimens.medium.width,
                            Expanded(
                              child: Text(
                                order[index].product!,
                                style: AppTextStyles.productTitle,
                                textDirection: TextDirection.rtl,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        AppDimens.medium.height,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "با تخفیف: ${int.parse(order[index].discountPrice!).separateWithComma} تومان",
                              textDirection: TextDirection.rtl,
                              style: AppTextStyles.productPrice,
                            ),
                            Text(
                              'قیمت: ${int.parse(order[index].price!).separateWithComma}',
                              style: AppTextStyles.oldPrice,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
