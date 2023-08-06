import 'package:birthday_app/features/general/data/repository/guests/guests-firebase.dart';
import 'package:birthday_app/features/general/data/repository/guests/guests-hive-database.dart';

import '../../models/guests/guest.dart';

class GuestsRepository {
  final GuestsFirebaseApi api = GuestsFirebaseApi();
  final GuestsHiveDatabase database = GuestsHiveDatabase();

  Future<void> init() async {
    database.init();
  }

  Future<void> addGuest(Guest guest) async{
    database.addGuest(guest);
    await api.addGuest(guest: guest);
  }

  Future<List<Guest>> getGuests() async {
    final List<Guest> cachedGuests = database.getGuests();
    if(cachedGuests != null) {
      return cachedGuests;
    }
    final List<Guest> apiGuests = (api.readGuests()) as List<Guest>;
    await database.storeGuests(apiGuests);
    return apiGuests;
  }

  Future<void> updateGuest(Guest oldGuest, Guest newGuest) async {
   database.updateGuest(oldGuest, newGuest);
   await api.updateGuest(oldGuest.id, newGuest);
  }

  Future<void> removeGuest(Guest guest)async{
    database.removeGuest(guest);
    await api.removeGuest(guest);
  }

}