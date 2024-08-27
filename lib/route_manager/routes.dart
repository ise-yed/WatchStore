import 'package:flutter/material.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/auth/send_otp_screen.dart';
import 'package:watch_store/screens/mainScreen/main_screen.dart';
import 'package:watch_store/screens/product_list/product_list_screen.dart';
import 'package:watch_store/screens/product_single/product_single_screen.dart';
import 'package:watch_store/screens/register/register_screen.dart';
import 'package:watch_store/screens/splash_screen.dart';

import '../screens/auth/verify_code_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.root: (context) => const SplashScreen(),
  // ScreenNames.root:(context) =>  SendOtpScreen(),
  ScreenNames.verifyCodeScreen: (context) => const VerifyCodeScreen(),
  ScreenNames.sendOtpScreen: (context) => SendOtpScreen(),
  ScreenNames.registerScreen: (context) => const RegisterScreen(),
  ScreenNames.mainScreen: (context) => const MainScreen(),
  ScreenNames.productListScreen: (context) => ProductListScreen(
        catTitle: ValueNotifier(""),
        isActiveSort: ValueNotifier(false),
      ),
  ScreenNames.productSingleScreen: (context) => const ProductSingleScreen(id: 0,),
};
