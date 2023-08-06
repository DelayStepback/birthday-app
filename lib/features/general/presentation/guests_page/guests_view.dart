import 'package:birthday_app/features/general/presentation/blocs/guests_bloc/guests_event.dart';
import 'package:birthday_app/features/general/presentation/guests_page/widgets/add-guest-modal.dart';
import 'package:birthday_app/features/general/presentation/guests_page/widgets/guests-list-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/guests_bloc/guests_bloc.dart';
import '../blocs/guests_bloc/guests_state.dart';
import '../utils/appBar-regular.dart';

class GuestsPage extends StatelessWidget {
  const GuestsPage({super.key});

  void addGuest(BuildContext context, String action) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)).w),
      context: context,
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16).w,
        child: AddGuestModalMenu(
          action: action,
          oldGuest: null,
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
      body: BlocBuilder<GuestsBloc, GuestsState>(
        builder: (context, state) {
          if (state is GuestsLoadingState) {
            BlocProvider.of<GuestsBloc>(context).add(LoadGuestsEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GuestsLoadedState) {
            return GuestsList(guestList: state.allGuests);
          }
          return const Text('loading failed: ');
        },
      ),
      floatingActionButton: Container(
        width: 84.w,
        height: 84.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => addGuest(context, 'create'),
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
