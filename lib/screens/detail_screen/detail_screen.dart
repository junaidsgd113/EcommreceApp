import 'package:ecommerceapp/core/model/cartmodel.dart';
import 'package:ecommerceapp/core/model/wishlistmodel.dart';
import 'package:ecommerceapp/core/riverpod/detailscreen_provider.dart';
import 'package:ecommerceapp/widget/customtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:expandable_text/expandable_text.dart';
import '../../core/model/products.dart';
import '../../core/riverpod/cartscreen_provider.dart';
import '../../core/riverpod/wishlistscreen_provider.dart';
import '../cart _screen/cart_screen.dart';
import 'detailscreen_responsive.dart';

// ignore: must_be_immutable
class DetailProductScreen extends ConsumerStatefulWidget {
  Product product;

  DetailProductScreen(
    this.product, {
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyDetailProductScreenState();
}

class _MyDetailProductScreenState extends ConsumerState<DetailProductScreen> {
  final List<Color> colorList = [
    Colors.red,
    Colors.black,
    const Color(0xffF1F1F1),
    Colors.amber,
    const Color(0xff50555C)
  ];
  bool alreadysaved = true;
  @override
  Widget build(BuildContext context) {
    List<CartModel> cartlist = ref.watch(cartlistprovider);
    List<WishListModel> wishlist = ref.watch(filterProvider).wishlistAll;
    final detailscreen = ref.watch(detailscreenProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Stack(
                    children: [
                      IconButton(
                        iconSize: 24,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(),
                              ));
                        },
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                          bottom: 8,
                          left: 3,
                          child: Stack(
                            children: [
                              const Icon(
                                Icons.brightness_1,
                                size: 20,
                                color: Colors.red,
                              ),
                              Positioned.fill(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        cartlist.length.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      )))
                            ],
                          ))
                    ],
                  )),
            ),
          ]),
      body: LayoutBuilder(builder: (context, constraints) {
        return (constraints.maxWidth < 600)
            ? SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(),
                        child: Image.network(
                          widget.product.thumnail ?? '',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24, top: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 264,
                              child: Text(
                                widget.product.title ?? '',
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 24.spMin,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  WishListModel newproduct = WishListModel(
                                      uuid: widget.product.uuid,
                                      category: widget.product.category,
                                      thumnail: widget.product.thumnail,
                                      title: widget.product.title,
                                      price: widget.product.price);

                                  if (wishlist.contains(newproduct)) {
                                    ref
                                        .read(filterProvider.notifier)
                                        .removeproductfromWishlist(newproduct);
                                    Fluttertoast.showToast(
                                      msg: 'Remove From Wishlist',
                                      backgroundColor: Colors.red,
                                    );
                                  } else {
                                    ref
                                        .read(filterProvider.notifier)
                                        .addproducttowishlist(newproduct);
                                    Fluttertoast.showToast(
                                      msg: 'Add to Wishlist',
                                      backgroundColor: Colors.red,
                                    );
                                  }
                                },
                                icon: Icon(
                                  ref
                                          .read(filterProvider.notifier)
                                          .isProductInWishlist(
                                              widget.product.uuid.toString())
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24, top: 7),
                        child: SizedBox(
                          height: 80,
                          child: ExpandableText(
                            widget.product.description ?? '',
                            expandText: 'Read more',
                            collapseText: 'Read less',
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff828282)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24, top: 14),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              itemSize: 25,
                              minRating: 1,
                              itemBuilder: (context, index) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              },
                              onRatingUpdate: (rating) {},
                            ),
                            customText(
                                Colors.black,
                                widget.product.rating.toString(),
                                FontWeight.w600,
                                15.spMin),
                            customText(const Color(0xff828282),
                                '(2,500 reviews)', FontWeight.w600, 15.spMin),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24, top: 14),
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                                "NGN ${widget.product.price.toString()}",
                                style: const TextStyle(
                                    color: Color(0xff222222),
                                    fontFamily: 'inter',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24, top: 21),
                        child: Container(
                          width: 327,
                          height: 2,
                          color: const Color(0xffF1F1F1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24, top: 32),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: customText(const Color(0xff222222),
                                  'Colors', FontWeight.w700, 14),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, left: 166)
                                      .w,
                              child: customText(const Color(0xff222222),
                                  'Quantity', FontWeight.w700, 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                          right: 24,
                        ),
                        child: SizedBox(
                          height: 28,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: colorList.length + 1,
                              itemBuilder: (context, index) {
                                return (index != colorList.length)
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: 28,
                                          width: 28,
                                          decoration: BoxDecoration(
                                              color: colorList[index],
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 28.0),
                                        child: Container(
                                          height: 28,
                                          width: 102,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 26,
                                                width: 32,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60)),
                                                child: TextButton(
                                                  onPressed: () {
                                                    ref
                                                        .read(
                                                            detailscreenProvider
                                                                .notifier)
                                                        .decresesegmentedvalue();
                                                  },
                                                  child: Image.asset(
                                                      'assets/images/minus.jpg'),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(),
                                                child: Container(
                                                    height: 28,
                                                    width: 34,
                                                    color:
                                                        const Color(0xffF1F1F1),
                                                    child: Center(
                                                      child: Text(
                                                          "${detailscreen.quantity}",
                                                          style: const TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: Color(
                                                                  0xff222222))),
                                                    )),
                                              ),
                                              Container(
                                                height: 26,
                                                width: 32,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60)),
                                                child: TextButton(
                                                  onPressed: () {
                                                    ref
                                                        .read(
                                                            detailscreenProvider
                                                                .notifier)
                                                        .incresesegmentedvalue();
                                                  },
                                                  child: Image.asset(
                                                      'assets/images/plus.jpg'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ]),
              )
            : ResponsiveDetailScreen(
                product: widget.product,
                cartlist: cartlist,
                colorList: colorList,
                wishlist: wishlist,
                constraints: constraints,
                detailscreen: detailscreen,
              );
      }),
      bottomNavigationBar: LayoutBuilder(builder: (context, constrants) {
        return (constrants.maxWidth < 600)
            ? InkWell(
                onTap: () {
                  CartModel newProduct = CartModel(
                    uuid: widget.product.uuid,
                    thumnail: widget.product.thumnail,
                    title: widget.product.title,
                    price: widget.product.price,
                    quantity: detailscreen.quantity,
                  );
                  bool alreadySaved = false;
                  for (var product in cartlist) {
                    if (product.uuid == newProduct.uuid) {
                      alreadySaved = true;
                      break;
                    }
                  }
                  if (alreadySaved) {
                    detailscreen.resetquentity();
                    Fluttertoast.showToast(
                      msg: 'Already Added to cart',
                      backgroundColor: Colors.red,
                    );
                  } else {
                    ref
                        .read(cartlistprovider.notifier)
                        .addproducttocartlist(newProduct);
                    detailscreen.resetquentity();
                    Fluttertoast.showToast(
                      msg: 'Add to Cartlist',
                      backgroundColor: Colors.red,
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: 20,
                  ).h,
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0xff222222),
                    ),
                    child: customText(const Color(0xffFFFFFF), 'Add to cart',
                        FontWeight.w700, 16),
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  CartModel newProduct = CartModel(
                    uuid: widget.product.uuid,
                    thumnail: widget.product.thumnail,
                    title: widget.product.title,
                    price: widget.product.price,
                    quantity: detailscreen.quantity,
                  );
                  bool alreadySaved = false;
                  for (var product in cartlist) {
                    if (product.uuid == newProduct.uuid) {
                      alreadySaved = true;
                      break;
                    }
                  }

                  if (alreadySaved) {
                    detailscreen.resetquentity();
                    Fluttertoast.showToast(
                      msg: 'Already Added to CartList',
                      backgroundColor: Colors.red,
                    );
                  } else {
                    ref
                        .read(cartlistprovider.notifier)
                        .addproducttocartlist(newProduct);
                    detailscreen.resetquentity();
                    Fluttertoast.showToast(
                        msg: 'Add to CartList', backgroundColor: Colors.red);
                  }
                },
                child: Padding(
                  padding: constrants.maxWidth < 900
                      ? const EdgeInsets.only(
                          left: 150, right: 150, top: 8, bottom: 10)
                      : const EdgeInsets.only(
                          left: 500, right: 500, bottom: 10, top: 10),
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0xff222222),
                    ),
                    child: customText(const Color(0xffFFFFFF), 'Add to cart',
                        FontWeight.w700, 16),
                  ),
                ),
              );
      }),
    );
  }
}
