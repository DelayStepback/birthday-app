import 'package:birthday_app/features/general/data/models/general/entertainments.dart';
import 'package:equatable/equatable.dart';

class EntertainmentsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EntertainmentsLoadingState extends EntertainmentsState {
  @override
  List<Object?> get props => [];
}

class EntertainmentsLoadedState extends EntertainmentsState {
  final List<Entertainments> entertainments;
  final int listCount;
  EntertainmentsLoadedState(this.entertainments, this.listCount);
  @override
  List<Object?> get props => [entertainments,listCount];
}

class EntertainmentsErrorState extends EntertainmentsState{
  final String error;
  EntertainmentsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}