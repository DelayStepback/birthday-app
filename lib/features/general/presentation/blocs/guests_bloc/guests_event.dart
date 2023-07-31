import 'package:equatable/equatable.dart';

import '../../../data/models/guests/guest.dart';

abstract class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object?> get props => [];
}

class AddGuest extends GuestsEvent {
  final Guest guest;

  const AddGuest({
    required this.guest,
  });

  @override
  List<Object?> get props => [guest];
}

class UpdateGuest extends GuestsEvent {
  final Guest guest;
  final Guest newStateGuest;

  const UpdateGuest({
    required this.guest,
    required this.newStateGuest,
  });

  @override
  List<Object?> get props => [guest];
}

class DeleteGuest extends GuestsEvent {
  final Guest guest;

  const DeleteGuest({
    required this.guest,
  });

  @override
  List<Object?> get props => [guest];
}

class LoadGuestsEvent extends GuestsEvent{
  @override
  List<Object?> get props => [];
}