import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/wishlist/wishitem.dart';
import '../../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../../blocs/wishlist_bloc/wishlist_event.dart';
import '../../guests_page/widgets/text-input-field.dart';

class AddWishItemModalMenu extends StatefulWidget {
  final String action;
  final WishItem? oldWishItem;

  const AddWishItemModalMenu(
      {super.key, required this.action, this.oldWishItem});

  @override
  State<AddWishItemModalMenu> createState() => _AddWishItemModalMenuState();
}

class _AddWishItemModalMenuState extends State<AddWishItemModalMenu> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override
  void initState() {
    if (widget.action == 'update') {
      titleController.text = widget.oldWishItem!.title;
      linkController.text = widget.oldWishItem!.link;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 633.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Dialog(
            elevation: 0,
            insetPadding: const EdgeInsets.all(0),
            child: SizedBox(
              height: 633.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  TextInputField(
                      textEditingController: titleController,
                      labelText: 'Название',
                      autofocus: true),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextInputField(
                      textEditingController: linkController,
                      labelText: 'Ссылка',
                      autofocus: false),
                  SizedBox(
                    height: 50.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      var wishItem = WishItem(
                        title: titleController.text,
                        link: linkController.text,
                        selected: false,
                      );
                      if (widget.action == 'create') {
                        context
                            .read<WishItemsBloc>()
                            .add(AddWishItem(wishItem: wishItem));
                        Navigator.pop(context);
                      }
                      if (widget.action == 'update') {
                        context.read<WishItemsBloc>().add(UpdateWishItem(
                            wishItem: widget.oldWishItem!,
                            newStateWishItem: wishItem));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: 181.w,
                      height: 50.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12).r,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF47802B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15).r,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Добавить подарок',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
