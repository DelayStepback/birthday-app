import 'package:equatable/equatable.dart';
import '../../models/guests/guest.dart';

class GuestsState extends Equatable{

  late final List<Guest> allGuests;
  GuestsState( {
    this.allGuests = const <Guest> []
  });


  @override
  // TODO: implement props
  List<Object?> get props => [allGuests];
}
