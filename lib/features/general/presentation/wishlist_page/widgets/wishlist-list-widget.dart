import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/wishlist/wishitem.dart';
import '../../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../../blocs/wishlist_bloc/wishlist_event.dart';
import 'add-wishlist-modal.dart';

class WishItemsList extends StatelessWidget {
  const WishItemsList({
    super.key,
    required this.wishItemList,
  });

  final List<WishItem> wishItemList;

  void updateWishItem(BuildContext context, String action, WishItem wishItem) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      context: context,
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: AddWishItemModalMenu(
          action: action,
          oldWishItem: wishItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: wishItemList.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey<int>(index),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                Builder(
                  builder: (cont) {
                    return ElevatedButton(
                      onPressed: () {
                        Slidable.of(cont)!.close();
                        cont
                            .read<WishItemsBloc>()
                            .add(DeleteWishItem(wishItem: wishItemList[index]));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.red,
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 25.sp,
                      ),
                    );
                  },
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                Builder(builder: (cont) {
                  return ElevatedButton(
                    onPressed: () {
                      updateWishItem(cont, 'update', wishItemList[index]);
                      Slidable.of(cont)!.close();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.blue,
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  );
                }),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 16, right: 16).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wishItemList[index].title,
                        style: TextStyle(
                          color: const Color(0xFF171010),
                          fontSize: 14.sp,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchUrl(wishItemList[index].link),
                        child: Text(
                          'Ссылка',
                          style: TextStyle(
                            color: const Color(0xFF4E4343),
                            fontSize: 14.sp,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: ()=>{
                    context.read<WishItemsBloc>().add(
                    ChangeCheckBoxWishItemEvent(
                    wishItem: wishItemList[index]))
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      height: 20.r,
                      width: 20.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: wishItemList[index].selected ? Color(0xFF4E4343) : Color(0xFFD9D9D9),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 16.h,
          );
        },
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }
}
