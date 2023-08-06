import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xid/xid.dart';

import '../../models/guests/guest.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _guestsCollection = _firestore.collection('guests');
final docGuest = _guestsCollection.doc();

class GuestsFirebaseApi {

  Future<void> addGuest({
    required Guest guest,
  }) async {
    var xid = Xid().toString();
    guest.id = xid;
    print(xid);
    final json = guest.toJson();
    await _guestsCollection.doc(xid).set(json);
  }

  Future<void> updateGuest(oldGuestId, Guest newGuest) async{
    newGuest.id = oldGuestId;
    final json = newGuest.toJson();
    await _guestsCollection.doc(oldGuestId).set(json);
  }


  Future<void> removeGuest(Guest guest) async {
    await _guestsCollection.doc(guest.id).delete();
  }

  Stream<List<Guest>> readGuests(){
    return _guestsCollection.snapshots().map((snapshot) => snapshot.docs.map((doc) => Guest.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }

}
