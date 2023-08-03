import 'package:birthday_app/features/general/presentation/blocs/wishlist_bloc/wishlist_event.dart';
import 'package:birthday_app/features/general/presentation/blocs/wishlist_bloc/wishlist_state.dart';
import 'package:bloc/bloc.dart';

import '../../../data/models/wishlist/wishitem.dart';
import '../../../data/services/wishlist-service.dart';

class WishItemsBloc extends Bloc<WishItemsEvent, WishItemsState> {
  final WishItemsService _wishItemsService;

  WishItemsBloc(this._wishItemsService) : super(WishItemsLoadingState()) {
    on<AddWishItem>(_onAddWishItem);
    on<UpdateWishItem>(_onUpdateWishItem);
    on<DeleteWishItem>(_onDeleteWishItem);
    on<LoadWishItemsEvent>(_onLoadWishItemsEvent);
    on<ChangeCheckBoxWishItemEvent>(_onChangeCheckBoxWishItemEvent);
  }

  void _onAddWishItem(AddWishItem event, Emitter<WishItemsState> emit) {
    final state = this.state;
    if (state is WishItemsLoadedState) {
      _wishItemsService.addWishItem(event.wishItem);
      emit(WishItemsLoadedState(
          allWishItems: List.from(state.allWishItems)
            ..add(event.wishItem)));
    }
  }

  void _onUpdateWishItem(UpdateWishItem event, Emitter<WishItemsState> emit) {
    final state = this.state;
    final wishItem = event.wishItem;
    final newStateWishItem = event.newStateWishItem;

    if (state is WishItemsLoadedState) {
      _wishItemsService.updateWishItem(event.wishItem, event.newStateWishItem);
      final int index = state.allWishItems.indexOf(wishItem);
      List<WishItem> allWishItems = List.from(state.allWishItems)
        ..remove(wishItem);
      allWishItems.insert(index, newStateWishItem);
      emit(WishItemsLoadedState(allWishItems: allWishItems));
    }
  }

  void _onDeleteWishItem(DeleteWishItem event, Emitter<WishItemsState> emit) {
    final state = this.state;
    if (state is WishItemsLoadedState) {
      _wishItemsService.removeWishItem(event.wishItem);
      emit(WishItemsLoadedState(
          allWishItems: List.from(state.allWishItems)
            ..remove(event.wishItem)));
    }
  }

  Future<void> _onLoadWishItemsEvent(LoadWishItemsEvent event, emit) async {
    // emit(WishItemsLoadingState());
    await _wishItemsService.init();
    final List<WishItem> wishItems = _wishItemsService.getWishItems();
    emit(WishItemsLoadedState(allWishItems: wishItems));
  }

  void _onChangeCheckBoxWishItemEvent(ChangeCheckBoxWishItemEvent event, emit) {
    final state = this.state;
    if (state is WishItemsLoadedState) {
      List<WishItem> wishItems = List.from(state.allWishItems);
      int indexToChange = wishItems.indexOf(event.wishItem);
      WishItem itemToChange = wishItems[indexToChange];
      _wishItemsService.updateWishItem(event.wishItem, event.wishItem.copyWith(selected: !itemToChange.selected));
      wishItems[indexToChange] = itemToChange.copyWith(selected: !itemToChange.selected);
      emit(WishItemsLoadedState(allWishItems: wishItems));
    }
  }
}
