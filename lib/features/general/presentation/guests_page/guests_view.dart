import 'package:birthday_app/features/general/presentation/blocs/guests_bloc/guests_event.dart';
import 'package:birthday_app/features/general/presentation/guests_page/widgets/add-guest-modal.dart';
import 'package:birthday_app/features/general/presentation/guests_page/widgets/guests-list-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/guests_bloc/guests_bloc.dart';
import '../blocs/guests_bloc/guests_state.dart';

class GuestsPage extends StatelessWidget {
  const GuestsPage({super.key});

  void addGuest(BuildContext context, String action) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        context: context,
        builder: (context) =>
            SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: AddGuestModalMenu(
                  action: action,
                  oldGuest: null,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 48,
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back_ios,
              size: 14,
              color: Color(0xFFC0C0CA),
            ),
            onTap: () => Navigator.pop(context),
          ),
          title: Text(
            'Список гостей',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: BlocBuilder<GuestsBloc, GuestsState>(
          builder: (context, state) {
            if (state is GuestsLoadingState) {
              BlocProvider.of<GuestsBloc>(context).add(LoadGuestsEvent());
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GuestsLoadedState){
              return GuestsList(guestList: state.allGuests);
            }
            return Text('loading failed');
          },
        ),
        floatingActionButton: Container(
          width: 84.w,
          height: 84.w,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () => addGuest(context, 'create'),
              backgroundColor: const Color(0xFF47802B),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                size: 56,
              ),
            ),
          ),
        ));
  }
}
