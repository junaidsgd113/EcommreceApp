import 'package:ecommerceapp/core/model/cartmodel.dart';
import 'package:ecommerceapp/screens/cart%20_screen/cartscreen_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerceapp/main.dart';
import '../../core/model/products.dart';
import '../../core/riverpod/cartscreen_provider.dart';
import '../../widget/customtext_widget.dart';

// ignore: must_be_immutable
class CartScreen extends ConsumerStatefulWidget {
  Product? product;
  CartScreen({
    super.key,
    this.product,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<CartModel> cartlist = ref.watch(cartlistprovider);
    final totalPrice = ref.watch(cartlistprovider.notifier).totalprice();
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F8),
      appBar: AppBar(
          backgroundColor: const Color(0xffF4F6F8),
          toolbarHeight: 60,
          elevation: 0,
          leading: BackButton(
            color: const Color(0xff222222),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homepage(),
                ),
              );
            },
          ),
          title: LayoutBuilder(builder: (context, constraints) {
            return Center(
                child: Text(
              'My Cart',
              style: TextStyle(
                  fontSize: constraints.maxWidth < 600 ? 20 : 30,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  color: Colors.black),
            ));
          }),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Color(0xff222222),
                ))
          ]),
      body: LayoutBuilder(builder: (context, constraints) {
        return (constraints.maxWidth < 600)
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 23,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: cartlist.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 126,
                          width: 350,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Color(0xffF1F1F1)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 23, bottom: 24),
                                child: Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        cartlist[index].thumnail ?? '',
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, left: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 142,
                                          child: Text(
                                              cartlist[index].title ?? '',
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  color: Color(0xff828282))),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: IconButton(
                                              onPressed: () {
                                                ref
                                                    .read(cartlistprovider
                                                        .notifier)
                                                    .removeproductfromcartlist(
                                                        cartlist[index].isarId,cartlist[index]);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.black,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 4, left: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 127,
                                          child: customText(
                                              const Color(0xff222222),
                                              "NGN ${cartlist[index].price ?? ''}",
                                              FontWeight.w700,
                                              16),
                                        ),
                                        Container(
                                          height: 24,
                                          width: 72,
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 22,
                                                width: 22,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Image.asset(
                                                    'assets/images/minus.jpg',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(),
                                                child: Container(
                                                    height: 24,
                                                    width: 24,
                                                    color:
                                                        const Color(0xffF4F6F8),
                                                    child: Center(
                                                      child: customText(
                                                          const Color(0xff222222),
                                                          '${cartlist[index].quantity}',
                                                          FontWeight.w800,
                                                          12),
                                                    )),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Image.asset(
                                                    'assets/images/plus.jpg',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),  
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ));
                    }),
              )
            : ResponsiveCartScreen(
                cartlist: cartlist,
                product: widget.product,
                totalprice: totalPrice,
                constraints: constraints,
              );
      }),
      bottomNavigationBar: LayoutBuilder(builder: (context, constraints) {
        return (constraints.maxWidth < 600)
            ? InkWell(
                onTap: () {},
                child: Container(
                  height: 80,
                  width: 375,
                  decoration: const BoxDecoration(color: Color(0xffF4F6F8)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 164,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22.0, top: 21),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(const Color(0xff828282), 'Total price',
                                    FontWeight.w500, 14),
                                customText(const Color(0xff828282), "NGN $totalPrice",
                                    FontWeight.w700, 16),
                              ]),
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 172,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xff222222),
                        ),
                        child: customText(
                            const Color(0xffFFFFFF), 'Checkout', FontWeight.w700, 16),
                      ),
                    ],
                  ),
                ),
              )
            : InkWell(
                onTap: () {},
                child: Padding(
                  padding: constraints.maxWidth < 700
                      ? const EdgeInsets.only(left: 120, right: 120)
                      : constraints.maxWidth < 900
                          ? const EdgeInsets.only(left: 220, right: 146)
                          : constraints.maxWidth < 1100
                              ? const EdgeInsets.only(left: 330, right: 180)
                              : constraints.maxWidth < 1200
                                  ? const EdgeInsets.only(left: 400, right: 210)
                                  : constraints.maxWidth < 1400
                                      ? const EdgeInsets.only(
                                          left: 500.0, right: 350)
                                      : const EdgeInsets.only(
                                          left: 600.0, right: 440),
                  child: Container(
                    height: 66,
                    width: 220,
                    decoration: const BoxDecoration(color: Color(0xffF4F6F8)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 164,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22.0, top: 21),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total price',
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth < 900
                                              ? 12
                                              : 14,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: const Color(0xff828282))),
                                  Text("NGN $totalPrice",
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth < 900
                                              ? 14
                                              : 18,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          color: const Color(0xff828282)))
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34.0),
                          child: Container(
                            height: 40,
                            width: 156,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color(0xff222222),
                            ),
                            child: Text(
                              'Checkout',
                              style: TextStyle(
                                color: const Color(0xffFFFFFF),
                                fontSize: constraints.maxWidth < 900 ? 12 : 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
