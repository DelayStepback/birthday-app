import 'package:equatable/equatable.dart';

import '../../../data/models/wishlist/wishitem.dart';

class WishItemsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WishItemsLoadingState extends WishItemsState {
  @override
  List<Object?> get props => [];
}

class WishItemsLoadedState extends WishItemsState {
  final List<WishItem> allWishItems;

  WishItemsLoadedState({required this.allWishItems});

  @override
  List<Object?> get props => [allWishItems];
}

class WishItemsErrorState extends WishItemsState {
  final String error;

  WishItemsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
