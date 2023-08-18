import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/model/cartmodel.dart';
import '../../core/model/products.dart';
import '../../core/riverpod/cartscreen_provider.dart';
//////////////Responsive code of CartScreen///////////////////////////
// ignore: must_be_immutable
class ResponsiveCartScreen extends ConsumerStatefulWidget {
  ResponsiveCartScreen(
      {super.key,
      required this.cartlist,
      this.product,
      required this.constraints,
      required this.totalprice});
  List<CartModel> cartlist;
  Product? product;
  final totalprice;
  BoxConstraints constraints;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResponsiveCartScreenState();
}

class _ResponsiveCartScreenState extends ConsumerState<ResponsiveCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.constraints.maxWidth < 700
          ? const EdgeInsets.only(left: 120, right: 120)
          : widget.constraints.maxWidth < 900
              ? const EdgeInsets.only(left: 220, right: 146)
              : widget.constraints.maxWidth < 1100
                  ? const EdgeInsets.only(left: 330, right: 180)
                  : widget.constraints.maxWidth < 1200
                      ? const EdgeInsets.only(left: 400, right: 210)
                      : widget.constraints.maxWidth < 1400
                          ? const EdgeInsets.only(left: 500.0, right: 350)
                          : const EdgeInsets.only(left: 600.0, right: 440),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.cartlist.length,
          itemBuilder: (context, index) {
            return Container(
                height: widget.constraints.maxWidth < 900 ? 140 : 160,
                width: widget.constraints.maxWidth < 900 ? 370 : 390,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: Color(0xffF1F1F1)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 23, bottom: 24),
                      child: Container(
                        height: widget.constraints.maxWidth < 900 ? 96 : 116,
                        width: widget.constraints.maxWidth < 900 ? 116 : 136,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              widget.cartlist[index].thumnail ?? '',
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: widget.constraints.maxWidth < 900
                              ? const EdgeInsets.only(top: 18, left: 18)
                              : const EdgeInsets.only(top: 24, left: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 142,
                                child: Text(widget.cartlist[index].title ?? '',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize:
                                            widget.constraints.maxWidth < 900
                                                ? 16
                                                : 18,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: const Color(0xff828282))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: IconButton(
                                    onPressed: () {
                                      ref
                                          .read(cartlistprovider.notifier)
                                          .removeproductfromcartlist(
                                              widget.cartlist[index].isarId,widget.cartlist[index]);
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
                          padding: const EdgeInsets.only(top: 4, left: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 127,
                                child: Text(
                                    "NGN ${widget.cartlist[index].price.toString()}",
                                    style: TextStyle(
                                        fontSize:
                                            widget.constraints.maxWidth < 900
                                                ? 18
                                                : 20,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        color: const Color(0xff222222))),
                              ),
                              Container(
                                height: 24,
                                width: 72,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 22,
                                      width: 22,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Image.asset(
                                          'assets/images/minus.jpg',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Container(
                                          height: 24,
                                          width: 24,
                                          color: const Color(0xffF1F1F1),
                                          child: Center(
                                            child: Text(
                                                widget.cartlist[index].quantity
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w800,
                                                    fontStyle: FontStyle.normal,
                                                    color: Color(0xff222222))),
                                          )),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
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
    );
  }
}
