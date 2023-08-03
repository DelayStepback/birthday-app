import 'package:birthday_app/features/general/presentation/utils/age-calculate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/models/guests/guest.dart';
import '../../blocs/guests_bloc/guests_bloc.dart';
import '../../blocs/guests_bloc/guests_event.dart';
import '../../utils/format-guests-count.dart';
import 'add-guest-modal.dart';
import 'dropdown-button-filter.dart';

class GuestsList extends StatelessWidget {
  const GuestsList({
    super.key,
    required this.guestList,
  });

  final List<Guest> guestList;

  void updateGuest(BuildContext context, String action, Guest guest) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        context: context,
        builder: (context) => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: AddGuestModalMenu(
              action: action,
              oldGuest: guest,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 16, right: 16).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${guestList.length} ${formatGuestsCount(guestList.length)}',
                  style: TextStyle(
                    color: const Color(0xFF4E4343),
                    fontSize: 14.sp,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const DropdownButtonFilter(),
              ],
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: guestList.length,
            itemBuilder: (context, index) {
              return Slidable(
                key: ValueKey<int>(index),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    Builder(builder: (cont) {
                      return ElevatedButton(
                        onPressed: () {
                          Slidable.of(cont)!.close();
                          cont
                              .read<GuestsBloc>()
                              .add(DeleteGuest(guest: guestList[index]));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.red,
                        ),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 25.sp,
                        ),
                      );
                    }),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    Builder(builder: (cont) {
                      return ElevatedButton(
                        onPressed: () {
                          updateGuest(cont, 'update', guestList[index]);
                          Slidable.of(cont)!.close();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 32.r,
                        child: Image.asset(
                          'assets/images/guests/avatar_default.png',
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${guestList[index].firstName} ${guestList[index].lastName}',
                            style: TextStyle(
                              color: const Color(0xFF171010),
                              fontSize: 14.sp,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ageCalculate(DateTime.now(),
                                    guestList[index].birthdayDate)
                                .toString(),
                            style: TextStyle(
                              color: const Color(0xFF4E4343),
                              fontSize: 12.sp,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            guestList[index].profession,
                            style: TextStyle(
                              color: Color(0xFF4E4343),
                              fontSize: 14.sp,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
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
        ],
      ),
    );
  }
}
