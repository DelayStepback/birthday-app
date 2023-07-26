
import 'package:flutter/material.dart';

import '../../../data/models/guests/guest.dart';

class GuestsList extends StatelessWidget {
  const GuestsList({
    super.key,
    required this.guestList,
  });

  final List<Guest> guestList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: guestList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(guestList[index].firstName),
            subtitle: Text(guestList[index].profession),
          );
        });
  }
}
