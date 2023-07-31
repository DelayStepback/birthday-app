import 'package:birthday_app/features/general/data/models/general/entertainments.dart';
import 'package:equatable/equatable.dart';

abstract class EntertainmentsEvent extends Equatable {}

class LoadEntertainmentsEvent extends EntertainmentsEvent {
  @override
  List<Object?> get props => [];
}


class ChangeViewEntertainmentsEvent extends EntertainmentsEvent {
  final List<Entertainments> entertainments;
  final int listCount;
  ChangeViewEntertainmentsEvent({
    required this.entertainments,
    required this.listCount,
  });

  @override
  List<Object?> get props => [entertainments, listCount];
}