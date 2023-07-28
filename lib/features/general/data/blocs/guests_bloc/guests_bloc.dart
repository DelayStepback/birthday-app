import 'package:bloc/bloc.dart';

import '../../models/guests/guest.dart';
import 'guests_event.dart';
import 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(const GuestsState()) {
    on<AddGuest>(_onAddGuest);
    on<UpdateGuest>(_onUpdateGuest);
    on<DeleteGuest>(_onDeleteGuest);
  }

  void _onAddGuest(AddGuest event, Emitter<GuestsState> emit) {
    final state = this.state;
    emit(GuestsState(allGuests: List.from(state.allGuests)..add(event.guest)));
  }

  void _onUpdateGuest(UpdateGuest event, Emitter<GuestsState> emit) {
    final state = this.state;
    final guest = event.guest;
    final newStateGuest = event.newStateGuest;
    final int index = state.allGuests.indexOf(guest);
    List<Guest> allGuests = List.from(state.allGuests)..remove(guest);
    allGuests.insert(index, newStateGuest);
    emit(GuestsState(allGuests: allGuests));

  }

  void _onDeleteGuest(DeleteGuest event, Emitter<GuestsState> emit) {
    final state = this.state;
    emit(GuestsState(allGuests: List.from(state.allGuests)..remove(event.guest)));
  }
}
