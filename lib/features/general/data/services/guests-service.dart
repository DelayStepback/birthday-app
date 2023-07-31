import 'package:hive/hive.dart';

import '../models/guests/guest.dart';

class GuestsService {
  late Box<Guest> _guests;

  Future<void> init() async {
    Hive.registerAdapter(GuestAdapter());
    _guests = await Hive.openBox<Guest>('guests');
    _guests.add(Guest(firstName: 'InitialName', lastName: 'asdasd', birthdayDate: DateTime.now(), createdTime: DateTime.now(), phone: '32424', profession: 'profession'));
  }

  Future<Guest> getGuest(String firstName, String lastName) async {
    final Guest guest = _guests.values.firstWhere((element) =>
        element.firstName == firstName && element.lastName == lastName);
    return guest;
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

  bool _eqTwoGuests(Guest element, Guest guest) {
    return element.firstName == guest.firstName &&
        element.lastName == guest.lastName &&
        element.birthdayDate == guest.birthdayDate &&
        element.createdTime == guest.createdTime &&
        element.phone == guest.phone &&
        element.profession == guest.profession;
  }
}
