import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/model/wishlistmodel.dart';

// ignore: must_be_immutable
class GridViewWidget extends ConsumerStatefulWidget {
  GridViewWidget({
    super.key,
    required this.wishlist,
    required this.onTap,
    required this.remove,
  });

  List<WishListModel> wishlist;
  VoidCallback? onTap;
  void Function()? onPress;
  bool remove;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends ConsumerState<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        itemCount: widget.wishlist.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: constraints.maxWidth < 500
              ? 2
              : constraints.maxWidth < 700
                  ? 3
                  : constraints.maxWidth < 900
                      ? 4
                      : constraints.maxWidth < 1100
                          ? 5
                          : constraints.maxWidth < 1200
                              ? 6
                              : constraints.maxWidth < 1400
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
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xffF4F6F8)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.network(
                                  widget.wishlist[index].thumnail ?? '',
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            left:constraints.maxWidth < 400
                  ? 102
                  : constraints.maxWidth < 900
                      ? 116
                      : constraints.maxWidth < 1030
                          ? 122
                          :constraints.maxWidth < 1200
                              ?122
                              : constraints.maxWidth < 1300
                                  ? 116
                                  : 124,
                            top: 2,
                            child: Stack(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                          'assets/images/heart.png')),
                                )
                              ],
                            ),
                          ),
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
                                  widget.wishlist[index].title.toString(),
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
      );
    });
  }
}
