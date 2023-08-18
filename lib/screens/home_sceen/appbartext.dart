import 'package:ecommerceapp/core/model/cartmodel.dart';
import 'package:ecommerceapp/core/riverpod/cartscreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widget/customtext_widget.dart';
import '../cart _screen/cart_screen.dart';
import '../wishlist_screen/wishlist_screen.dart';

class AppBarText extends ConsumerStatefulWidget {
  const AppBarText({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppBarTextState();
}

class _AppBarTextState extends ConsumerState<AppBarText> {
  @override
  Widget build(BuildContext context) {
    List<CartModel> cartlist = ref.watch(cartlistprovider);
    int itemCount = cartlist.length;

    return LayoutBuilder(builder: (context, constraints) {
      return (constraints.maxWidth < 600)
          ? Padding(
              padding: const EdgeInsets.only(left: 0, top: 30, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       customText(const Color(0xff222222), 'E-shop', FontWeight.w600, 20),
                      const SizedBox(height: 4),
                      customText(const Color(0xff333333),
                          '5,000+products and categories.', FontWeight.w400, 12)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: .0),
                          child: IconButton(
                            iconSize: 42,
                            onPressed: () {},
                            icon: Center(
                              child: Stack(
                                children: [
                                  Center(
                                    child: IconButton(
                                        iconSize: 30,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CartScreen(),
                                              ));
                                        },
                                        icon: Image.asset(
                                          'assets/images/shopping.png',
                                        )),
                                  ),
                                  Positioned(
                                      bottom: 18,
                                      left: 18,
                                      child: Stack(
                                        children: [
                                          const Icon(
                                            Icons.brightness_1,
                                            size: 18,
                                            color: Colors.red,
                                          ),
                                          Positioned.fill(
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    itemCount.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 8),
                                                  )))
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WishListScreen(),
                                ));
                          },
                          icon: Image.asset(
                            'assets/images/heart.png',
                            scale: 1.8,
                          ))
                    ],
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 0, top: 30, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        customText(const Color(0xff222222), 'E-shop', FontWeight.w600, 20),
                    
                      const SizedBox(height: 4),
                      customText(const Color(0xff333333),
                          '5,000+products and categories.', FontWeight.w400, 12)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: .0),
                          child: IconButton(
                            iconSize: 50,
                            onPressed: () {},
                            icon: Center(
                              child: Stack(
                                children: [
                                  Center(
                                    child: IconButton(
                                        iconSize: 30,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CartScreen(),
                                              ));
                                        },
                                        icon: Image.asset(
                                          'assets/images/shopping.png',
                                        )),
                                  ),
                                  Positioned(
                                      bottom: 24,
                                      left: 24,
                                      child: Stack(
                                        children: [
                                          const Icon(
                                            Icons.brightness_1,
                                            size: 22,
                                            color: Colors.red,
                                          ),
                                          Positioned.fill(
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    itemCount.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  )))
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WishListScreen(),
                                ));
                          },
                          icon: Image.asset(
                            'assets/images/heart.png',
                            scale: 0.2,
                          ))
                    ],
                  )
                ],
              ),
            );
    });
  }
}
