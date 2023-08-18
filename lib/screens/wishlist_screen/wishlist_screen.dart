import 'package:ecommerceapp/core/model/wishlistmodel.dart';
import 'package:ecommerceapp/screens/wishlist_screen/wishlistscreen_responsive.dart';
import 'package:ecommerceapp/widget/customtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/model/products.dart';
import '../../core/riverpod/wishlistscreen_provider.dart';
import 'gridviewwidget_wishlist.dart';

// ignore: must_be_immutable
class WishListScreen extends ConsumerStatefulWidget {
  Product? product;
  WishListScreen({
    super.key,
    this.product,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WishListScreenState();
}

class _WishListScreenState extends ConsumerState<WishListScreen> {
  var searchtextcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(filterProvider.notifier).smartphoneFilter();
      ref.read(filterProvider.notifier).laptopFilter();
      ref.read(filterProvider.notifier).perfumeFilter();
      ref.read(filterProvider.notifier).skincareFilter();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<WishListModel> wishlist = ref.watch(filterProvider).wishlistAll;
    List<WishListModel> phonelist = ref.watch(filterProvider).phonelist;
    List<WishListModel> laptoplist = ref.watch(filterProvider).laptoplist;
    List<WishListModel> perfumelist = ref.watch(filterProvider).perfumelist;
    List<WishListModel> serumlist = ref.watch(filterProvider).serumelist;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color(0xffF4F6F8),
              toolbarHeight: 50,
              elevation: 0,
              leading: const BackButton(
                color: Color(0xff222222),
              ),
              title: customSearchbar,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (customicon.icon == Icons.search) {
                        customicon = const Icon(
                          Icons.cancel,
                          color: Colors.grey,
                        );
                        customSearchbar = TextField(
                          onChanged: (value) {},
                          controller: searchtextcontroller,
                          decoration: const InputDecoration(
                              hintText: "search...",
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                          textInputAction: TextInputAction.go,
                          style: const TextStyle(fontSize: 16),
                        );
                      } else {
                        customicon = const Icon(
                          Icons.search,
                          color: Colors.grey,
                        );
                        customSearchbar = Center(
                          child: customText(
                              Colors.black, 'My WishList', FontWeight.w600, 20),
                        );
                      }
                    });
                  },
                  icon: customicon,
                )
              ]),
          body: LayoutBuilder(builder: (context, constraints) {
            return (constraints.maxWidth < 600)
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 24,
                      bottom: 16,
                    ),
                    child: Column(
                      children: [
                        ////////////////////////////////TabBar////////////////////////////
                        SizedBox(
                          height: 32,
                          child: TabBar(
                              indicator: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              isScrollable: true,
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(
                                  child: Container(
                                      height: 32,
                                      width: 88,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      child: const Center(
                                          child: Text(
                                        'All',
                                      ))),
                                ),
                                Tab(
                                  child: Container(
                                      height: 32,
                                      width: 88,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      child: const Center(
                                          child: Text(
                                        'Phone',
                                      ))),
                                ),
                                Tab(
                                  child: Container(
                                      height: 32,
                                      width: 88,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      child: const Center(
                                          child: Text(
                                        'Laptop',
                                      ))),
                                ),
                                Tab(
                                  child: Container(
                                      height: 32,
                                      width: 88,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      child: const Center(
                                          child: Text(
                                        'Perfume',
                                      ))),
                                ),
                                Tab(
                                  child: Container(
                                      height: 32,
                                      width: 88,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      child: const Center(
                                          child: Text(
                                        'Serum',
                                      ))),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        //////////////////Show Products Acordding to TabBar/////////////////////
                        Expanded(
                          child: TabBarView(
                            children: [
                              GridView.builder(
                                itemCount: wishlist.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 24, top: 0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 120,
                                                    width:
                                                        MediaQuery.of(context)
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
                                                            BorderRadius
                                                                .circular(16),
                                                        color: const Color(
                                                            0xffF4F6F8)),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                        child: Image.network(
                                                          wishlist[index]
                                                                  .thumnail ??
                                                              '',
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                  Positioned(
                                                      left: 102,
                                                      top: 2,
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
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  ref
                                                                      .read(filterProvider
                                                                          .notifier)
                                                                      .removeproductfromWishlistpage(
                                                                          wishlist[index]
                                                                              .isarId,wishlist[index]);
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 8, 0, 0),
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          wishlist[index]
                                                              .title
                                                              .toString(),
                                                          style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize:
                                                                  12.spMin,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
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
                                                  const EdgeInsets.fromLTRB(
                                                      8, 5, 0, 0),
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "NGN ${wishlist[index].price ?? ''}",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  14.spMin,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: const Color(
                                                                  0xff828282)),
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
                                wishlist: phonelist,
                                onTap: () {},
                                remove: false,
                              ),
                              GridViewWidget(
                                wishlist: laptoplist,
                                onTap: () {},
                                remove: false,
                              ),
                              GridViewWidget(
                                wishlist: perfumelist,
                                onTap: () {},
                                remove: false,
                              ),
                              GridViewWidget(
                                wishlist: serumlist,
                                onTap: () {},
                                remove: false,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : ResponsiveWishListScreen(
                    wishlist: wishlist,
                    laptoplist: laptoplist,
                    phonelist: phonelist,
                    perfumelist: perfumelist,
                    serumlist: serumlist,
                    product: widget.product,
                    constraints: constraints);
          })),
    );
  }

  Icon customicon = const Icon(
    Icons.search,
    color: Colors.grey,
  );
  Widget customSearchbar = Center(
    child: Text(
      'My WishList',
      style: TextStyle(
          fontSize: 20.spMin,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          color: Colors.black),
    ),
  );
}
