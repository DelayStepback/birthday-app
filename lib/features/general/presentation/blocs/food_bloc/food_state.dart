import 'package:equatable/equatable.dart';

import '../../../data/models/general/food.dart';

class FoodState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FoodLoadingState extends FoodState {
  @override
  List<Object?> get props => [];
}

class FoodLoadedState extends FoodState {
  final List<Food> foods;
  final int gridCount;

  FoodLoadedState(this.foods, this.gridCount);

  @override
  List<Object?> get props => [foods, gridCount];
}

class FoodErrorState extends FoodState {
  final String error;

  FoodErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
