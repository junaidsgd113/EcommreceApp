import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/model/products.dart';
import '../../core/model/wishlistmodel.dart';
import '../../core/riverpod/wishlistscreen_provider.dart';
import 'gridviewwidget_wishlist.dart';

////////////////////Responsive code od wishlistScreen/////////////
// ignore: must_be_immutable
class ResponsiveWishListScreen extends ConsumerStatefulWidget {
  ResponsiveWishListScreen({
    super.key,
    required this.laptoplist,
    required this.phonelist,
    required this.perfumelist,
    required this.serumlist,
    this.product,
    required this.constraints,
    required this.wishlist,
  });
  List<WishListModel> wishlist;
  List<WishListModel> phonelist;
  List<WishListModel> laptoplist;
  List<WishListModel> perfumelist;
  List<WishListModel> serumlist;
  BoxConstraints constraints;
  Product? product;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResponsiveWishListScreenState();
}

class _ResponsiveWishListScreenState
    extends ConsumerState<ResponsiveWishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 24,
        right: 0,
        bottom: 16,
      ),
      child: Column(
        children: [
          ////////////////////////////////TabBar/////////////////////////////
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SizedBox(
              height: 32,
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)),
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Container(
                          height: 32,
                          width: widget.constraints.maxWidth < 600
                              ? 90
                              : widget.constraints.maxWidth < 800
                                  ? 120
                                  : widget.constraints.maxWidth < 1000
                                      ? 150
                                      : widget.constraints.maxWidth < 1200
                                          ? 200
                                          : 300,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5),
                              borderRadius: BorderRadius.circular(32)),
                          child: const Center(
                              child: Text(
                            'All',
                          ))),
                    ),
                    Tab(
                      child: Container(
                          height: 32,
                          width: widget.constraints.maxWidth < 600
                              ? 90
                              : widget.constraints.maxWidth < 800
                                  ? 120
                                  : widget.constraints.maxWidth < 1000
                                      ? 150
                                      : widget.constraints.maxWidth < 1200
                                          ? 200
                                          : 300,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5),
                              borderRadius: BorderRadius.circular(32)),
                          child: const Center(
                              child: Text(
                            'Phone',
                          ))),
                    ),
                    Tab(
                      child: Container(
                          height: 32,
                          width: widget.constraints.maxWidth < 600
                              ? 90
                              : widget.constraints.maxWidth < 800
                                  ? 120
                                  : widget.constraints.maxWidth < 1000
                                      ? 150
                                      : widget.constraints.maxWidth < 1200
                                          ? 200
                                          : 300,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5),
                              borderRadius: BorderRadius.circular(32)),
                          child: const Center(
                              child: Text(
                            'Laptop',
                          ))),
                    ),
                    Tab(
                      child: Container(
                          height: 32,
                          width: widget.constraints.maxWidth < 600
                              ? 90
                              : widget.constraints.maxWidth < 800
                                  ? 120
                                  : widget.constraints.maxWidth < 1000
                                      ? 150
                                      : widget.constraints.maxWidth < 1200
                                          ? 200
                                          : 300,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5),
                              borderRadius: BorderRadius.circular(32)),
                          child: const Center(
                              child: Text(
                            'Perfume',
                          ))),
                    ),
                    Tab(
                      child: Container(
                          height: 32,
                          width: widget.constraints.maxWidth < 600
                              ? 90
                              : widget.constraints.maxWidth < 800
                                  ? 150
                                  : widget.constraints.maxWidth < 1000
                                      ? 170
                                      : widget.constraints.maxWidth < 1200
                                          ? 200
                                          : 300,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5),
                              borderRadius: BorderRadius.circular(32)),
                          child: const Center(
                              child: Text(
                            'Serum',
                          ))),
                    ),
                  ]),
            ),
          ),
          const SizedBox(
            height: 24,
          ),

          ////////////////////////show products Acordding to TabBar////////////////////////
          Expanded(
            child: TabBarView(
              children: [
                GridView.builder(
                  itemCount: widget.wishlist.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.constraints.maxWidth < 700
                        ? 3
                        : widget.constraints.maxWidth < 900
                            ? 4
                            : widget.constraints.maxWidth < 1100
                                ? 5
                                : widget.constraints.maxWidth < 1200
                                    ? 6
                                    : widget.constraints.maxWidth < 1400
                                        ? 7
                                        : 8,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(right: 24, top: 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(
                                                0,
                                                2.0,
                                              ),
                                            ),
                                          ],
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: const Color(0xffF4F6F8)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          child: Image.network(
                                            widget.wishlist[index].thumnail ??
                                                '',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Positioned(
                                        left: widget.constraints.maxWidth < 400
                                            ? 102
                                            : widget.constraints.maxWidth < 900
                                                ? 116
                                                : widget.constraints.maxWidth <
                                                        1030
                                                    ? 122
                                                    : widget.constraints
                                                                .maxWidth <
                                                            1200
                                                        ? 122
                                                        : widget.constraints
                                                                    .maxWidth <
                                                                1300
                                                            ? 116
                                                            : 124,
                                        top: 2,
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: IconButton(
                                                  onPressed: () {
                                                    ref
                                                        .read(filterProvider
                                                            .notifier)
                                                        .removeproductfromWishlistpage(
                                                            widget
                                                                .wishlist[index]
                                                                .isarId,widget.wishlist[index]);
                                                  },
                                                  icon: Image.asset(
                                                      'assets/images/heart.png')),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        children: [
                                          Text(
                                            widget.wishlist[index].title
                                                .toString(),
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12.spMin,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                color: const Color(0xff18191F)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        children: [
                                          Text(
                                            "NGN ${widget.wishlist[index].price ?? ''}",
                                            style: TextStyle(
                                                fontSize: 14.spMin,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                color: const Color(0xff828282)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]));
                  },
                ),
                GridViewWidget(
                  wishlist: widget.phonelist,
                  onTap: () {},
                  remove: false,
                ),
                GridViewWidget(
                  wishlist: widget.laptoplist,
                  onTap: () {},
                  remove: false,
                ),
                GridViewWidget(
                  wishlist: widget.perfumelist,
                  onTap: () {},
                  remove: false,
                ),
                GridViewWidget(
                  wishlist: widget.serumlist,
                  onTap: () {},
                  remove: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
