import 'package:birthday_app/features/general/data/services/guests-service.dart';
import 'package:bloc/bloc.dart';

import '../../../data/models/guests/guest.dart';
import 'guests_event.dart';
import 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  final GuestsService _guestsService;

  GuestsBloc(this._guestsService) : super(GuestsLoadingState()) {
    on<AddGuest>(_onAddGuest);
    on<UpdateGuest>(_onUpdateGuest);
    on<DeleteGuest>(_onDeleteGuest);
    on<LoadGuestsEvent>(_onLoadGuestsEvent);
  }

  void _onAddGuest(AddGuest event, Emitter<GuestsState> emit) {
    final state = this.state;
    if (state is GuestsLoadedState) {
      _guestsService.addGuest(event.guest);
      emit(GuestsLoadedState(
          allGuests: List.from(state.allGuests)..add(event.guest)));
    }
  }

  void _onUpdateGuest(UpdateGuest event, Emitter<GuestsState> emit) {
    final state = this.state;
    final guest = event.guest;
    final newStateGuest = event.newStateGuest;

    if (state is GuestsLoadedState) {
      _guestsService.updateGuest(event.guest, event.newStateGuest);
      final int index = state.allGuests.indexOf(guest);
      List<Guest> allGuests = List.from(state.allGuests)..remove(guest);
      allGuests.insert(index, newStateGuest);
      emit(GuestsLoadedState(allGuests: allGuests));
    }
  }

  void _onDeleteGuest(DeleteGuest event, Emitter<GuestsState> emit) {
    final state = this.state;
    if (state is GuestsLoadedState) {
      _guestsService.removeGuest(event.guest);
      emit(GuestsLoadedState(
          allGuests: List.from(state.allGuests)..remove(event.guest)));
    }
  }

  Future<void> _onLoadGuestsEvent(LoadGuestsEvent event, emit)async {
   // emit(GuestsLoadingState());
    await _guestsService.init();
    final List<Guest> guests = _guestsService.getGuests();
    emit(GuestsLoadedState(allGuests: guests));
  }
}
