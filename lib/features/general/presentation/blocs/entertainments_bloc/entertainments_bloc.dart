import 'package:bloc/bloc.dart';

import '../../../data/repository/entertainments/entertainments-repository.dart';
import 'entertainments_event.dart';
import 'entertainments_state.dart';

class EntertainmentsBloc
    extends Bloc<EntertainmentsEvent, EntertainmentsState> {
  final EntertainmentsRepository _entertainmentsRepository;

  EntertainmentsBloc(this._entertainmentsRepository)
      : super(EntertainmentsLoadingState()) {
    on<LoadEntertainmentsEvent>(_onLoadEntertainmentsEvent);
    on<ChangeViewEntertainmentsEvent>(_changeViewEntertainmentsEvent);
  }

  Future<void> _onLoadEntertainmentsEvent(event, emit) async {
    emit(EntertainmentsLoadingState());
    try {
      final entertainments =
          await _entertainmentsRepository.loadEntertainmentsCatalog();
      emit(EntertainmentsLoadedState(entertainments, 2));
    } catch (e) {
      emit(EntertainmentsErrorState(e.toString()));
    }
  }

  void _changeViewEntertainmentsEvent(event, emit) {
    emit(EntertainmentsLoadedState(event.entertainments,
        event.listCount != 2 ? 2 : event.entertainments.length));
  }
}
