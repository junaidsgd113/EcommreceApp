import 'package:ecommerceapp/widget/customtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../search_screen/search_screen.dart';
/////////////////////////SearchBar of HomeScreeen///////////////////////////
class SearchbarHomeScreen extends ConsumerStatefulWidget {
  const SearchbarHomeScreen({
    super.key,
  });

  @override
 ConsumerState<ConsumerStatefulWidget> createState() => _SearchbarHomeScreenState();
}

class _SearchbarHomeScreenState extends ConsumerState<SearchbarHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return (constraints.maxWidth < 600)
          ? Padding(
              padding: const EdgeInsets.only(left: .0, top: 24, right: 22),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Searchscreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.78,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF4F6F8)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 19.0, right: 15),
                              child: Icon(
                                Icons.search,
                                color: Color(0xff828282),
                              ),
                            ),
                            customText(
                                const Color(0xff828282),
                                'Search products,brands...',
                                FontWeight.w400,
                                12)
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset(
                      'assets/images/sliders.png',
                    ),
                  ),
                ],
              ),
            )
          :
          ////////////Responsive code of SearchBar/////////////////////
           Padding(
              padding: const EdgeInsets.only(left: .0, top: 24, right: 22),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Searchscreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: constraints.maxWidth < 900
                          ? MediaQuery.of(context).size.width * 0.85
                          : MediaQuery.of(context).size.width * 0.90,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF4F6F8)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 19.0, right: 15),
                              child: Icon(
                                Icons.search,
                                color: Color(0xff828282),
                              ),
                            ),
                            customText(
                                const Color(0xff828282),
                                'Search products,brands...',
                                FontWeight.w400,
                                12)
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      'assets/images/sliders.png',
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
