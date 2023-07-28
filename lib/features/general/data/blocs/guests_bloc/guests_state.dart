import 'package:equatable/equatable.dart';
import '../../models/guests/guest.dart';

class GuestsState extends Equatable{

  final List<Guest> allGuests;
  const GuestsState( {
    this.allGuests = const <Guest> []
  });


  @override
  // TODO: implement props
  List<Object?> get props => [allGuests];
}
