import 'package:birthday_app/features/general/data/blocs/bloc_exports.dart';
import 'package:birthday_app/features/general/presentation/guests_page/guests_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/blocs/bloc/guests_event.dart';
import '../../../data/models/guests/guest.dart';
import 'add-guest-modal.dart';

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
    return ListView.builder(
        itemCount: guestList.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey<int>(index),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),

              children: [
                SlidableAction(
                  onPressed: (context) => {
                    context
                        .read<GuestsBloc>()
                        .add(DeleteGuest(guest: guestList[index]))
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => {
//                      AddGuestModalMenu(action: 'update', oldGuest: guestList[index],)
                    updateGuest(
                      context,
                      'update',
                      guestList[index],
                    )
                  },
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Update',
                ),
              ],
            ),
            child: ListTile(
              title: Text(guestList[index].firstName),
              subtitle: Text(guestList[index].profession),
            ),
          );
        });
  }
}
