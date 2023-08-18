import 'package:ecommerceapp/core/model/cartmodel.dart';
import 'package:ecommerceapp/core/riverpod/wishlistscreen_provider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/model/products.dart';
import '../../core/model/wishlistmodel.dart';
import '../../core/riverpod/detailscreen_provider.dart';
import '../../widget/customtext_widget.dart';

////////////////////////Responsive code of DetailScreen .////////////////////////
// ignore: must_be_immutable
class ResponsiveDetailScreen extends ConsumerStatefulWidget {
  ResponsiveDetailScreen({
    super.key,
    required this.colorList,
    required this.cartlist,
    required this.wishlist,
    this.detailscreen,
    required this.constraints,
    required this.product,
  });
  List<CartModel> cartlist;
  List<WishListModel> wishlist;
  List<Color> colorList;
  final detailscreen;
  BoxConstraints constraints;
  Product product;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResponsiveDetailScreenState();
}

class _ResponsiveDetailScreenState
    extends ConsumerState<ResponsiveDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 126.0, right: 126),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: widget.constraints.maxWidth < 900
                    ? const EdgeInsets.only(left: 24, right: 24)
                    : const EdgeInsets.only(left: 24, right: 24, top: 10),
                child: Container(
                  height: widget.constraints.maxWidth < 900 ? 200 : 400,
                  width: MediaQuery.of(context).size.width,
                  decoration: widget.constraints.maxWidth < 900
                      ? const BoxDecoration(
                          color: Color(0xffF4F6F8),
                        )
                      : BoxDecoration(
                          color: const Color(0xffF4F6F8),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4, blurStyle: BlurStyle.normal)
                            ]),
                  child: Image.network(
                    widget.product.thumnail ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24, top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 264,
                      child: Text(
                        widget.product.title ?? '',
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontStyle: FontStyle.normal,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          WishListModel product = WishListModel(
                              uuid: widget.product.uuid,
                              category: widget.product.category,
                              thumnail: widget.product.thumnail,
                              title: widget.product.title,
                              price: widget.product.price);
                          if (widget.wishlist.contains(product)) {
                            ref
                                .read(filterProvider.notifier)
                                .removeproductfromWishlist(product);
                            Fluttertoast.showToast(
                                msg: 'Remove From Wishlist',
                                backgroundColor: Colors.red);
                          } else {
                            ref
                                .read(filterProvider.notifier)
                                .addproducttowishlist(product);
                            Fluttertoast.showToast(
                                msg: 'Add to Wishlist',
                                backgroundColor: Colors.red);
                          }
                        },
                        icon: const Icon(
                          Icons.favorite,
                          // : Icons.favorite_border_outlined,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24, top: 7),
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
                padding: const EdgeInsets.only(left: 24.0, right: 24, top: 14),
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
                    customText(Colors.black, widget.product.rating.toString(),
                        FontWeight.w600, 15.spMin),
                    customText(const Color(0xff828282), '(2,500 reviews)',
                        FontWeight.w600, 15.spMin),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24, top: 14),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("NGN ${widget.product.price.toString()}",
                        style: const TextStyle(
                            color: Color(0xff222222),
                            fontFamily: 'inter',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24, top: 21),
                child: Container(
                  width: 327,
                  height: 2,
                  color: const Color(0xffF1F1F1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24, top: 32),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: customText(const Color(0xff222222), 'Colors',
                          FontWeight.w700, 14),
                    ),
                    Padding(
                      padding: widget.constraints.maxWidth < 900
                          ? const EdgeInsets.only(left: 146).w
                          : const EdgeInsets.only(left: 258).w,
                      child: customText(const Color(0xff222222), 'Quantity',
                          FontWeight.w700, 14),
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
                      itemCount: widget.colorList.length + 1,
                      itemBuilder: (context, index) {
                        return (index != widget.colorList.length)
                            ? Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                      color: widget.colorList[index],
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              )
                            : Padding(
                                padding: widget.constraints.maxWidth < 900
                                    ? const EdgeInsets.only(left: 80).w
                                    : const EdgeInsets.only(left: 226).w,
                                child: Container(
                                  height: 28,
                                  width: 102,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1.5),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 26,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        child: TextButton(
                                          onPressed: () {
                                            ref
                                                .read(detailscreenProvider
                                                    .notifier)
                                                .decresesegmentedvalue();
                                          },
                                          child: Image.asset(
                                              'assets/images/minus.jpg'),
                                        ),
                                      ),
                                      Container(
                                          height: 28,
                                          width: 34,
                                          color: const Color(0xffF1F1F1),
                                          child: Center(
                                            child: Text(
                                                " ${widget.detailscreen.quantity}",
                                                style: TextStyle(
                                                    fontSize: 17.spMin,
                                                    fontWeight: FontWeight.w800,
                                                    fontStyle: FontStyle.normal,
                                                    color: const Color(
                                                        0xff222222))),
                                          )),
                                      Container(
                                        height: 26,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        child: TextButton(
                                          onPressed: () {
                                            ref
                                                .read(detailscreenProvider
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
            ]),
      ),
    );
  }
}
