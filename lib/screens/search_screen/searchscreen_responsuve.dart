import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/model/products.dart';
import '../../core/riverpod/searchscreen_provider.dart';
import '../detail_screen/detail_screen.dart';
////////////////////////////////Responsive code of SearchScreen//////////////////////////////////
// ignore: must_be_immutable
class ResponsiveSearchScreen extends ConsumerStatefulWidget {
   ResponsiveSearchScreen({super.key,
   required this.search,
   required this.constraints,
   required this.searchController,
   });
 List<Product> search;
BoxConstraints constraints;
TextEditingController searchController;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResponsiveSearchScreenState();
}

class _ResponsiveSearchScreenState extends ConsumerState<ResponsiveSearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 0, right: 20),
                  child:  Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width:widget. constraints.maxWidth < 900
                                  ? MediaQuery.of(context).size.width * 0.85
                                  : MediaQuery.of(context).size.width * 0.90,
                              height: 48,
                              child: TextField(
                                autofocus: true,
                                controller:widget. searchController,
                                onChanged: (value) {
                                ref.read(searchscreenprovider.notifier).fetchSearchproduts(value);
                                },
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    filled: true,
                                    fillColor: const Color(0xffF4F6F8),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none),
                                    hintText: 'Search products,brands...',
                                    hintStyle: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff828282))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Image.asset(
                                'assets/images/sliders.png',
                              ),
                            )
                          ],
                        ),
                       widget. constraints.maxWidth < 900
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF1F1F1),
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: (widget.search.isEmpty ||
                                  widget.searchController.text.isEmpty)
                              ? const Center(
                                  child: Padding(
                                  padding: EdgeInsets.only(top: 40.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.search_off_outlined,
                                        size: 100,
                                      ),
                                      Text(
                                        'No search',
                                        style: TextStyle(
                                            fontSize: 30, letterSpacing: 0),
                                      )
                                    ],
                                  ),
                                ))
                              : GridView.builder(
                                  itemCount: widget.search.length,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:widget. constraints.maxWidth < 800
                                        ? 3
                                        : widget.constraints.maxWidth < 1020
                                            ? 4
                                            : widget.constraints.maxWidth < 1120
                                                ? 5
                                                : widget.constraints.maxWidth < 1300
                                                    ? 6
                                                    :widget. constraints.maxWidth <
                                                            1500
                                                        ? 7
                                                        : 8,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 4, top: 0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailProductScreen(
                                                             widget. search [
                                                                  index]),
                                                    ),
                                                  );
                                                },
                                                child: Container(
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
                                                      
                                                              widget. search[
                                                                    index]
                                                                .thumnail ??
                                                            '',
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 10, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            
                                                               widget. search[
                                                                    index]
                                                                .title
                                                                .toString(),
                                                            style: const TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontSize: 12,
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
                                                            "NGN ${widget.search[index].price ?? ''}",
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                color: Color(
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
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
  }
}