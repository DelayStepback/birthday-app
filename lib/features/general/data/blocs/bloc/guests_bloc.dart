import 'package:bloc/bloc.dart';

import 'guests_event.dart';
import 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(GuestsState()) {
    on<AddGuest>(_onAddGuest);
    on<UpdateGuest>(_onUpdateGuest);
    on<DeleteGuest>(_onDeleteGuest);
  }

  void _onAddGuest(AddGuest event, Emitter<GuestsState> emit) {
    final state = this.state;
    emit(GuestsState(allGuests: List.from(state.allGuests)..add(event.guest)));
  }

  void _onUpdateGuest(UpdateGuest event, Emitter<GuestsState> emit) {}

  void _onDeleteGuest(DeleteGuest event, Emitter<GuestsState> emit) {}
}
