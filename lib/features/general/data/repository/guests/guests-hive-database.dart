import 'package:hive/hive.dart';

import '../../models/guests/guest.dart';

class GuestsHiveDatabase {
  late Box<Guest> _guests;

  Future<void> init() async {
    _guests = await Hive.openBox<Guest>("_guestsBox");
  }

  List<Guest> getGuests() {
    return _guests.values.toList();
  }

  void addGuest(Guest guest) {
    _guests.add(guest);
  }

  Future<void> removeGuest(Guest guest) async {
    final guestToRemove =
        _guests.values.firstWhere((element) => _eqTwoGuests(element, guest));
    await guestToRemove.delete();
  }

  Future<void> updateGuest(Guest oldGuest, Guest newGuest) async {
    final guestToUpdate =
        _guests.values.firstWhere((element) => _eqTwoGuests(element, oldGuest));
    final index = guestToUpdate.key as int;
    await _guests.put(index, newGuest);
  }

  Future<void> storeGuests(List<Guest> guests) async {
    _guests.addAll(guests);
  }
}

bool _eqTwoGuests(Guest element, Guest guest) {
  return element.id == guest.id;
}
