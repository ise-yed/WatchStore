import 'package:flutter/material.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/widget/btm_nav_item.dart';

import '../../widget/btm_nav_cart_item.dart';
import '../cart_screen/cart_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class BtmNavScreenIndex {
  BtmNavScreenIndex._();

  static const home = 0;
  static const cart = 1;
  static const profile = 2;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = BtmNavScreenIndex.home;
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _cartKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  final List<int> _routeHistory = [BtmNavScreenIndex.home];

  late final map = {
    BtmNavScreenIndex.home: _homeKey,
    BtmNavScreenIndex.cart: _cartKey,
    BtmNavScreenIndex.profile: _profileKey,
  };

  Future<bool> _onWillPop() async {
    if (map[selectedIndex]!.currentState!.canPop()) {
      map[selectedIndex]!.currentState!.pop();
    } else if (_routeHistory.length > 1) {
      setState(() {
        _routeHistory.removeLast();
        selectedIndex = _routeHistory.last;
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double btmNavHeight = size.height * .09;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: btmNavHeight,
                  child: IndexedStack(
                    index: selectedIndex,
                    children: [
                      Navigator(
                        key: _homeKey,
                        onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      ),
                      Navigator(
                        key: _cartKey,
                        onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      ),
                      Navigator(
                        key: _profileKey,
                        onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: btmNavHeight,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: AppColors.shadow, blurRadius: 10)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BtmNavItem(
                            iconPath: Assets.svg.user.path,
                            text: "پروفایل",
                            isActive:
                                selectedIndex == BtmNavScreenIndex.profile,
                            onTap: () =>
                                btmNavOnPressed(BtmNavScreenIndex.profile)),
                        BtmNavCartItem(
                            iconPath: Assets.svg.cart.path,
                            text: "سبد خرید",
                            isActive: selectedIndex == BtmNavScreenIndex.cart,
                            onTap: () =>
                                btmNavOnPressed(BtmNavScreenIndex.cart)),
                        BtmNavItem(
                            iconPath: Assets.svg.home.path,
                            text: "خانه",
                            isActive: selectedIndex == BtmNavScreenIndex.home,
                            onTap: () =>
                                btmNavOnPressed(BtmNavScreenIndex.home)),
                      ],
                    ),
                  ),),
            ],
          ),
        ),
      ),
    );
  }

  btmNavOnPressed(int index) {
    setState(() {
      selectedIndex = index;
      if (_routeHistory.last != selectedIndex) {
        _routeHistory.add(selectedIndex);
      }
    });
  }
}
