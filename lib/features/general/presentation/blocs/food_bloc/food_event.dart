import 'package:equatable/equatable.dart';

import '../../../data/models/general/food.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class LoadFoodEvent extends FoodEvent {
  @override
  List<Object?> get props => [];
}

class ChangeViewFoodsEvent extends FoodEvent {
  final int gridCount;
  final List<Food> foods;

  const ChangeViewFoodsEvent({
    required this.foods,
    required this.gridCount,
  });

  @override
  List<Object?> get props => [foods, gridCount];
}
