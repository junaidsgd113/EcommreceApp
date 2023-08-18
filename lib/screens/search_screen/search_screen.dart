import 'package:ecommerceapp/screens/search_screen/searchscreen_responsuve.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/model/products.dart';
import '../../core/riverpod/searchscreen_provider.dart';
import '../../widget/customtext_widget.dart';
import '../detail_screen/detail_screen.dart';

class Searchscreen extends ConsumerStatefulWidget {
  const Searchscreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __Searchscreen();
}

class __Searchscreen extends ConsumerState<Searchscreen> {
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> search = ref.watch(searchscreenprovider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          toolbarHeight: 50,
          elevation: 0,
          leading: const BackButton(
            color: Color(0xff222222),
          ),
          title: LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: constraints.maxWidth < 600
                  ? const EdgeInsets.only(left: 70.0)
                  : constraints.maxWidth < 900
                      ? const EdgeInsets.only(left: 270.0)
                      : const EdgeInsets.only(left: 670.0),
              child: customText(Colors.black, 'Search', FontWeight.w600, 20),
            );
          }),
        ),
        backgroundColor: const Color(0xffFFFFFF),
        body: LayoutBuilder(builder: (context, constraints) {
          return (constraints.maxWidth < 600)
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 23.0, top: 24, right: 21),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.78,
                            height: 48,
                            child: TextField(
                              autofocus: true,
                              controller: searchController,
                              onChanged: (value) {
                                ref
                                    .read(searchscreenprovider.notifier)
                                    .fetchSearchproduts(value);
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
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                              color: const Color(0xffF1F1F1),
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Expanded(
                        child: (search.isEmpty || searchController.text.isEmpty)
                            ? const Center(
                                child: Padding(
                                padding: EdgeInsets.only(top: 80.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.search_off_outlined,
                                      size: 100,
                                    ),
                                    Text(
                                      'No search',
                                      style: TextStyle(fontSize: 30),
                                    )
                                  ],
                                ),
                              ))
                            : GridView.builder(
                                itemCount: search.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.90,
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
                                                            search[index]),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 120,
                                                width: 150,
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
                                                      search[index].thumnail ??
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
                                                          search[index]
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
                                                          "NGN ${search[index].price ?? ''}",
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
                        height: 16,
                      )
                    ],
                  ),
                )
              : ResponsiveSearchScreen(
                  searchController: searchController,
                  search: search,
                  constraints: constraints,
                );
        }));
  }
}
