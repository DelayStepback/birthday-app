import 'package:equatable/equatable.dart';

import '../../../data/models/wishlist/wishitem.dart';


abstract class WishItemsEvent extends Equatable {
  const WishItemsEvent();

  @override
  List<Object?> get props => [];
}

class AddWishItem extends WishItemsEvent {
  final WishItem wishItem;

  const AddWishItem({
    required this.wishItem,
  });

  @override
  List<Object?> get props => [wishItem];
}

class UpdateWishItem extends WishItemsEvent {
  final WishItem wishItem;
  final WishItem newStateWishItem;

  const UpdateWishItem({
    required this.wishItem,
    required this.newStateWishItem,
  });

  @override
  List<Object?> get props => [wishItem];
}

class DeleteWishItem extends WishItemsEvent {
  final WishItem wishItem;

  const DeleteWishItem({
    required this.wishItem,
  });

  @override
  List<Object?> get props => [wishItem];
}

class LoadWishItemsEvent extends WishItemsEvent {
  @override
  List<Object?> get props => [];
}

class ChangeCheckBoxWishItemEvent extends WishItemsEvent {
  final WishItem wishItem;

  const ChangeCheckBoxWishItemEvent({
    required this.wishItem,
  });

  @override
  List<Object?> get props => [wishItem];
}