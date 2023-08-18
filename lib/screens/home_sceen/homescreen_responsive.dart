import 'package:ecommerceapp/screens/home_sceen/appbartext.dart';
import 'package:ecommerceapp/screens/home_sceen/searchbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/model/products.dart';
import '../../core/model/wishlistmodel.dart';
import '../../core/riverpod/wishlistscreen_provider.dart';
import '../../widget/customtext_widget.dart';
import '../detail_screen/detail_screen.dart';
//////////////////////Responsive code OF HomeScreen////////////////////////////
// ignore: must_be_immutable
class ResposiveHomeScreen extends ConsumerStatefulWidget {
  ResposiveHomeScreen(
      {super.key,
      this.productlist,
      this.wishlist,
      this.currentIndex,
      required this.constraints});
  List<Product>? productlist;
  List<WishListModel>? wishlist;
  int? currentIndex;
  BoxConstraints constraints;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResposiveHomeScreenState();
}

class _ResposiveHomeScreenState extends ConsumerState<ResposiveHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                ////////////////////////////////AppBarText/////////////////////////////
                const AppBarText(),
                ////////////////////////////////SearchBar///////////////////////////////
                const SearchbarHomeScreen(),
                /////Listview.builder ShowProducts with category/////////////
                SizedBox(
                  height: 146,
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.productlist!.length,
                      itemBuilder: (BuildContext context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              margin: const EdgeInsets.only(right: 16),
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
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color(0xffF4F6F8)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.network(
                                  widget.productlist![index].thumnail ?? '',
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                              child: SizedBox(
                                width: 80,
                                height: 32,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        children: [
                                          Text(
                                            widget.productlist![index].category
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                color: Color(0xff18191F)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
                Column(
                  children: [
          ///////////////////////AdvertiseMent card///////////////////
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 14, 25, 0),
                        child: SizedBox(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                              onPageChanged: (value) {
                                setState(() {
                                  widget.currentIndex = value;
                                });
                              },
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                    height: 148,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF4F6F8),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 50.0, top: 14),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                  const Color(0xff222222),
                                                  '40% off',
                                                  FontWeight.w700,
                                                  24),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4),
                                                child: customText(
                                                    const Color(0xff828282),
                                                    'on select sales',
                                                    FontWeight.w400,
                                                    12),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 8.0,
                                                ),
                                                child: Container(
                                                  height: 48,
                                                  width: 160,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: const Color(
                                                          0xff222222)),
                                                  child: Center(
                                                      child: customText(
                                                          const Color(
                                                              0xffFFFFFF),
                                                          'Shop Now',
                                                          FontWeight.w600,
                                                          10)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: Image.asset(
                                            'assets/images/Rectangle1.png',
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      ],
                                    ));
                              }),
                        )),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: SizedBox(
                        height: 10,
                        width: 46,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Container(
                                  height: 12,
                                  width: 16,
                                  decoration: BoxDecoration(
                                    color: index == widget.currentIndex
                                        ? Colors.black
                                        : Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
             //////////////SliverGrid ShowProducts  with Title and price/////////////
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.constraints.maxWidth < 700
                  ? 3
                  : widget.constraints.maxWidth < 900
                      ? 4
                      : widget.constraints.maxWidth < 1030
                          ? 5
                          : widget.constraints.maxWidth < 1200
                              ? 6
                              : widget.constraints.maxWidth < 1400
                                  ? 7
                                  : 8,
              mainAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 24, left: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailProductScreen(widget.productlist![index]),
                            ),
                          );
                        },
                        child: Center(
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
                                    borderRadius: BorderRadius.circular(16),
                                    color: const Color(0xffF4F6F8)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.network(
                                      widget.productlist![index].thumnail ?? '',
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Positioned(
                                  left: widget.constraints.maxWidth < 700
                                      ? 122
                                      : widget.constraints.maxWidth < 900
                                          ? 116
                                          : widget.constraints.maxWidth < 1030
                                              ? 122
                                              : widget.constraints.maxWidth <
                                                      1200
                                                  ? 116
                                                  : widget.constraints
                                                              .maxWidth <
                                                          1400
                                                      ? 116
                                                      : 122,
                                  top: 4,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: (ref
                                                                .read(filterProvider
                                                                    .notifier)
                                                                .isProductInWishlist(
                                                                  widget.productlist![index].uuid.toString()
                                                                        
                                                                        ))?
                                             const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.favorite_outline,
                                                color: Colors.red,
                                              ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
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
                                  widget.productlist![index].title.toString(),
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xff18191F)),
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
                                  "NGN ${widget.productlist![index].price ?? ''}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xff828282)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }, childCount: widget.productlist!.length),
          ),
        ],
      ),
    );
  }
}
