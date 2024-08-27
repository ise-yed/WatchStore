import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/profile/bloc/profile_bloc.dart';
import 'package:watch_store/screens/profile/order_list_screen.dart';
import 'package:watch_store/widget/surface_container.dart';

import '../../component/text_style.dart';
import '../../res/strings.dart';
import '../../widget/app_bar.dart';
import '../../widget/custom_loading.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(ProfileInit());
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
                    BlocProvider.of<ProfileBloc>(context).add(ProfileInit());
                  },
                  icon: const Icon(CupertinoIcons.refresh),
                ),
                const Text(
                  AppStrings.profile,
                  style: AppTextStyles.appBarText,
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) {
            if (current is ProfileSuccess ||
                current is ProfileLoading ||
                current is ProfileError) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppDimens.large),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppDimens.large.height,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            AppStrings.activeAddress,
                            style: AppTextStyles.productCaption,
                          ),
                        ),
                        AppDimens.small.height,
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              state.profileModel.userInfo?.address?.address??'',
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: AppTextStyles.selectedTab,
                            )),
                        const Divider(),
                        AppDimens.small.height,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimens.small),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.profileModel.userInfo?.mobile??'',
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab,
                                  ),
                                ),
                                AppDimens.small.width,
                                const Icon(
                                  CupertinoIcons.device_phone_portrait,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimens.small),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.profileModel.userInfo?.phone??'',
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab,
                                  ),
                                ),
                                AppDimens.small.width,
                                SvgPicture.asset(
                                  Assets.svg.phone.path,
                                  height: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimens.small),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.profileModel.userInfo?.name??'',
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab,
                                  ),
                                ),
                                AppDimens.small.width,
                                SvgPicture.asset(
                                  Assets.svg.userMenu.path,
                                  height: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimens.small),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    state.profileModel.userInfo?.address?.postalCode??'',
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab,
                                  ),
                                ),
                                AppDimens.small.width,
                                const Icon(
                                  Icons.location_on_outlined,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SurfaceContainer(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${state.profileModel.userProcessingCount}  سفارش',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab,
                                  ),
                                  8.height,
                                  Text(
                                    '${state.profileModel.userCancelCount}  سفارش',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab,
                                  ),
                                  8.height,
                                  Text(
                                    '${state.profileModel.userReceivedCount}  سفارش',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab,
                                  ),
                                ],
                              ),
                              12.width,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'در حال پردازش:  ',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab.copyWith(color: Colors.blue),
                                  ),
                                  8.height,
                                  Text(
                                    'لغو شده:  ',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab.copyWith(color: Colors.red),
                                  ),
                                  8.height,
                                  Text(
                                    'تحویل شده:  ',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.selectedTab.copyWith(color: Colors.green),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        SurfaceContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.medium),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderListScreen(
                                              screen: 'delivered'),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          Assets.svg.delivered.path),
                                      AppDimens.small.height,
                                      const Text(
                                        AppStrings.delivered,
                                        style: AppTextStyles.avatarText,
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderListScreen(
                                        screen: 'cancelled',
                                      ),
                                    ),
                                  ),
                                  behavior: HitTestBehavior.opaque,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          Assets.svg.cancelled.path),
                                      AppDimens.small.height,
                                      const Text(
                                        AppStrings.cancelled,
                                        style: AppTextStyles.avatarText,
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderListScreen(
                                        screen: 'inProccess',
                                      ),
                                    ),
                                  ),
                                  behavior: HitTestBehavior.opaque,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          Assets.svg.inProccess.path),
                                      AppDimens.small.height,
                                      const Text(
                                        AppStrings.inProccess,
                                        style: AppTextStyles.avatarText,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is ProfileLoading) {
              return const CustomLoading();
            } else if (state is ProfileError) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.error,
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
              throw Exception("Invalid $state State");
            }
          },
        ),
      ),
    );
  }
}
