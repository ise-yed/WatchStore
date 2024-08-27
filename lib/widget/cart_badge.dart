import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/data/repo/cart_repo.dart';

import '../gen/assets.gen.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key,});

  //final int count;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cartRepository.cartCount,
      builder: (context, value, child) {
        return Stack(
          children: [
            const SizedBox(
              height: 33,
              width: 33,
            ),
            SvgPicture.asset(
              Assets.svg.cart.path,
              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              height: 28,
            ),
            Visibility(
                visible: cartRepository.cartCount.value > 0 ? true : false,
                child: Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Text(
                        cartRepository.cartCount.value.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ))),
          ],
        );
      },
    );
  }
}
