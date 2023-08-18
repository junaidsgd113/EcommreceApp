import 'package:ecommerceapp/core/model/products.dart';
import 'package:ecommerceapp/core/model/wishlistmodel.dart';
import 'package:ecommerceapp/core/riverpod/cartscreen_provider.dart';
import 'package:ecommerceapp/screens/home_sceen/searchbar.dart';
import 'package:ecommerceapp/widget/customtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/riverpod/homescreen_provider.dart';
import '../../core/riverpod/wishlistscreen_provider.dart';
import '../detail_screen/detail_screen.dart';
import 'homescreen_responsive.dart';
import 'appbartext.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(homescreenprovider.notifier).fetchprodutsFromisardb();
      ref.read(filterProvider.notifier).getFavoriteProductfromisar();
      ref.read(cartlistprovider.notifier).getcartsfromisar();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> productlist = ref.watch(homescreenprovider);
    List<WishListModel> wishlist = ref.watch(filterProvider).wishlistAll;
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return (constraints.maxWidth < 600)
                  ? Padding(
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
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 23, 0, 0),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productlist.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 80,
                                              width: 80,
                                              margin: const EdgeInsets.only(
                                                  right: 16),
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
                                                  color:
                                                      const Color(0xffF4F6F8)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                child: Image.network(
                                                  productlist[index].thumnail ??
                                                      '',
                                                  fit: BoxFit.fill,
                                                  alignment: Alignment.center,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 8, 0, 0),
                                              child: SizedBox(
                                                width: 80,
                                                height: 32,
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            productlist[index]
                                                                .category
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                color: Color(
                                                                    0xff18191F)),
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
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 14, 25, 0),
                                        child: SizedBox(
                                          height: 148,
                                          child: PageView.builder(
                                              onPageChanged: (value) {
                                                setState(() {
                                                  currentIndex = value;
                                                });
                                              },
                                              itemCount: 3,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                    height: 148,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffF4F6F8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 28.0,
                                                                  left: 16),
                                                          child: Column(
                                                            children: [
                                                              customText(
                                                                  const Color(
                                                                      0xff222222),
                                                                  '40% off',
                                                                  FontWeight
                                                                      .w700,
                                                                  24),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 4),
                                                                child: customText(
                                                                    const Color(
                                                                        0xff828282),
                                                                    'on select sales',
                                                                    FontWeight
                                                                        .w400,
                                                                    12),
                                                              ),
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 8),
                                                                height: 24,
                                                                width: 88,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                4),
                                                                    color: const Color(
                                                                        0xff222222)),
                                                                child: Center(
                                                                    child: customText(
                                                                        const Color(
                                                                            0xffFFFFFF),
                                                                        'Shop Now',
                                                                        FontWeight
                                                                            .w600,
                                                                        10)),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 23.0,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/Rectangle.png',
                                                          ),
                                                        )
                                                      ],
                                                    ));
                                              }),
                                        )),
                                    const SizedBox(height: 12),

                                    ////////////////////Advertisement card/////////////////////
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24.0),
                                      child: SizedBox(
                                        height: 10,
                                        width: 46,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                child: Container(
                                                  height: 6,
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                    color: index == currentIndex
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
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                            ),
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 24, left: 0),
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
                                                  DetailProductScreen(
                                                      productlist[index]),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 120,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
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
                                                        BorderRadius.circular(
                                                            16),
                                                    color: const Color(
                                                        0xffF4F6F8)),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    child: Image.network(
                                                      productlist[index]
                                                              .thumnail ??
                                                          '',
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                              Positioned(
                                                  left: 102,
                                                  top: 4,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                        child: (ref
                                                                .read(filterProvider
                                                                    .notifier)
                                                                .isProductInWishlist(
                                                                    productlist[
                                                                            index]
                                                                        .uuid.toString()
                                                                        ))
                                                            ? const Icon(
                                                                Icons.favorite,
                                                                color:
                                                                    Colors.red,
                                                              )
                                                            : const Icon(
                                                                Icons
                                                                    .favorite_outline,
                                                                color:
                                                                    Colors.red,
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
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Column(
                                              children: [
                                                Text(
                                                  productlist[index]
                                                      .title
                                                      .toString(),
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 12.spMin,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: const Color(
                                                          0xff18191F)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 5, 0, 0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Column(
                                              children: [
                                                customText(
                                                    const Color(0xff828282),
                                                    "NGN ${productlist[index].price ?? ''}",
                                                    FontWeight.w500,
                                                    14.spMin)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }, childCount: productlist.length),
                          ),
                        ],
                      ),
                    )
                  : ResposiveHomeScreen(
                      productlist: productlist,
                      wishlist: wishlist,
                      constraints: constraints,
                    );
            },
          )),
    );
  }
}
