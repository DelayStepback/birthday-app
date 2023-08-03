import 'package:birthday_app/features/general/presentation/wishlist_page/widgets/add-wishlist-modal.dart';
import 'package:birthday_app/features/general/presentation/wishlist_page/widgets/wishlist-list-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../blocs/wishlist_bloc/wishlist_event.dart';
import '../blocs/wishlist_bloc/wishlist_state.dart';
import '../utils/appBar-regular.dart';

class WishItemsPage extends StatelessWidget {
  const WishItemsPage({super.key});

  void addWishItem(BuildContext context, String action) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)).w),
      context: context,
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16).w,
        child: AddWishItemModalMenu(
          action: action,
          oldWishItem: null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBF9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: AppBarRegular(
          titleName: 'Список гостей',
          appBar: AppBar(),
        ),
      ),
      body: BlocBuilder<WishItemsBloc, WishItemsState>(
        builder: (context, state) {
          if (state is WishItemsLoadingState) {
            BlocProvider.of<WishItemsBloc>(context).add(LoadWishItemsEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishItemsLoadedState) {
            return WishItemsList(wishItemList: state.allWishItems);
          }
          return const Text('loading failed: ');
        },
      ),
      floatingActionButton: Container(
        width: 84.w,
        height: 84.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => addWishItem(context, 'create'),
            backgroundColor: const Color(0xFF47802B),
            shape: const CircleBorder(),
            child: Icon(
              Icons.add,
              size: 56.r,
            ),
          ),
        ),
      ),
    );
  }
}
