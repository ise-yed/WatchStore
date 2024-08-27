import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool isInternetAvailable = true;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: isInternetAvailable
              ? Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.png.mainLogo.path,
                          width: 250,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 40,
                      right: 0,
                      left: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LoadingAnimationWidget.staggeredDotsWave(
                            color: AppColors.loadingColor,
                            size: 42,
                          ),
                          AppDimens.small.height,
                          const Text(
                            "لطفا منتظر بمانید",
                            style: AppTextStyles.loadingText,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.png.mainLogo.path,
                            width: 250,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      right: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          checkInternet();
                        }),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.refresh_thick,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("لطفا اتصال اینترنت خود را بررسی کنید",
                                style: AppTextStyles.error)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  checkInternet() {
    isInternetAvailable = true;
    Future.delayed(const Duration(seconds: 4)).then((value) async {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

          navigateToDesiredPage();
          setState(() {
            isInternetAvailable = true;
          });
        } else {
          setState(() {
            isInternetAvailable = false;
          });
        }
      } on SocketException catch (_) {
        setState(() {
          isInternetAvailable = false;
        });
      }
    });
  }

  void navigateToDesiredPage() {
    final state = context.read<AuthCubit>().state;
    debugPrint(state.toString());
    if (state is LoggedInState) {
      Navigator.pushReplacementNamed(context, ScreenNames.mainScreen);
    } else if (state is LoggedOutState) {
      Navigator.pushReplacementNamed(context, ScreenNames.sendOtpScreen);
    } else {
      Navigator.pushReplacementNamed(context, ScreenNames.sendOtpScreen);
    }
  }
}
