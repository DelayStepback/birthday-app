import 'package:equatable/equatable.dart';

import '../../../data/models/guests/guest.dart';

class GuestsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GuestsLoadingState extends GuestsState {
  @override
  List<Object?> get props => [];
}

class GuestsLoadedState extends GuestsState {
  final List<Guest> allGuests;

  GuestsLoadedState({required this.allGuests});

  @override
  List<Object?> get props => [allGuests];
}

class GuestsErrorState extends GuestsState {
  final String error;

  GuestsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
