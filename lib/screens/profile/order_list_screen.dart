import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/screens/profile/bloc/profile_bloc.dart';

import '../../component/text_style.dart';
import '../../res/dimens.dart';
import '../../widget/app_bar.dart';
import '../../widget/custom_loading.dart';
import '../../widget/custom_order_list.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key, required this.screen});

  final String screen;

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  void initState() {
    if (widget.screen == 'inProccess') {
      BlocProvider.of<ProfileBloc>(context).add(UserProcessingOrders());
    } else if (widget.screen == 'cancelled') {
      BlocProvider.of<ProfileBloc>(context).add(UserCancelledOrdersEvent());
    } else if (widget.screen == 'delivered') {
      BlocProvider.of<ProfileBloc>(context).add(UserReceivedOrders());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                widget.screen == 'inProccess'
                    ? const Text(
                        'لیست سفارشات در حال پردازش',
                        style: AppTextStyles.appBarText,
                      )
                    : widget.screen == 'cancelled'
                        ? const Text(
                            'لیست سفارشات لغو شده',
                            style: AppTextStyles.appBarText,
                          )
                        : const Text(
                            'لیست سفارشات تحویل شده',
                            style: AppTextStyles.appBarText,
                          )
              ],
            ),
          ),
        ),
        body: widget.screen == 'inProccess'
            ? BlocBuilder<ProfileBloc, ProfileState>(
                buildWhen: (previous, current) {
                  if (current is UserProcessingOrderSuccess ||
                      current is UserProcessingOrderLoading ||
                      current is UserProcessingOrderError) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  if (state is UserProcessingOrderSuccess) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.small),
                      child: state.orderList.isEmpty
                          ? Center(
                              child: Text(
                                'سفارش در حال پردازشی وجود ندارد',
                                style: AppTextStyles.appBarText.copyWith(
                                  color: const Color.fromARGB(255, 180, 16, 16),
                                ),
                              ),
                            )
                          : CustomOrderList(
                              orders: state.orderList,
                              orderStatus: 'Processing',
                            ),
                    );
                  } else if (state is UserProcessingOrderError) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.error,
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
                    return const CustomLoading();
                  }
                },
              )
            : widget.screen == 'cancelled'
                ? BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (previous, current) {
                      if (current is UserCancelledOrderError ||
                          current is UserCancelledOrderLoading ||
                          current is UserCancelledOrderSuccess) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                    builder: (context, state) {
                      if (state is UserCancelledOrderSuccess) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.small),
                          child: state.orderList.isEmpty
                              ? Center(
                                  child: Text(
                                    'سفارش لغو شده ای وجود ندارد',
                                    style: AppTextStyles.appBarText.copyWith(
                                      color: const Color.fromARGB(
                                          255, 180, 16, 16),
                                    ),
                                  ),
                                )
                              : CustomOrderList(
                                  orders: state.orderList,
                                  orderStatus: 'Cancelled',
                                ),
                        );
                      } else if (state is UserCancelledOrderError) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.error,
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
                        return const CustomLoading();
                      }
                    },
                  )
                : widget.screen == 'delivered'
                    ? BlocBuilder<ProfileBloc, ProfileState>(
                        buildWhen: (previous, current) {
                          if (current is UserReceivedOrderError ||
                              current is UserReceivedOrderLoading ||
                              current is UserReceivedOrderSuccess) {
                            return true;
                          } else {
                            return false;
                          }
                        },
                        builder: (context, state) {
                          if (state is UserReceivedOrderSuccess) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.small),
                              child: state.orderList.isEmpty
                                  ? Center(
                                      child: Text(
                                        'سفارش تحویل شده ای وجود ندارد',
                                        style:
                                            AppTextStyles.appBarText.copyWith(
                                          color: const Color.fromARGB(
                                              255, 180, 16, 16),
                                        ),
                                      ),
                                    )
                                  : CustomOrderList(
                                      orders: state.orderList,
                                      orderStatus: 'Received',
                                    ),
                            );
                          } else if (state is UserReceivedOrderError) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.error,
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
                            return const CustomLoading();
                          }
                        },
                      )
                    : const SizedBox(),
      ),
    );
  }
}
