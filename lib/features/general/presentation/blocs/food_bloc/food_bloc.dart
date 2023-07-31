import 'package:bloc/bloc.dart';

import '../../../data/repository/food/food-repository.dart';
import 'food_event.dart';
import 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodRepository _foodRepository;

  FoodBloc(this._foodRepository) : super(FoodLoadingState()) {
    on<LoadFoodEvent>(_onLoadFoodEvent);
    on<ChangeViewFoodsEvent>(_onChangeViewFoodsEvent);
  }

  Future<void> _onLoadFoodEvent(event,emit) async {
      emit(FoodLoadingState());
      try {
        final foods = await _foodRepository.loadFoodCatalog();
        emit(FoodLoadedState(foods, foods.length));
      } catch (e) {
        emit(FoodErrorState(e.toString()));
      }
  }
  void _onChangeViewFoodsEvent(event, emit){
    emit(FoodLoadedState(event.foods, event.gridCount != 2 ? 2 : event.foods.length));
  }
}
