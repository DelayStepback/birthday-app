import 'package:birthday_app/features/general/data/models/wishlist/wishitem.dart';
import 'package:hive/hive.dart';

class WishItemsService {
  late Box<WishItem> _wishlist;

  Future<void> init() async {
    _wishlist = await Hive.openBox<WishItem>("_wishlistBox");
  }

  List<WishItem> getWishItems() {
    return _wishlist.values.toList();
  }

  void addWishItem(WishItem wishItem) {
    _wishlist.add(wishItem);
  }

  Future<void> removeWishItem(WishItem wishItem) async {
    final wishItemToRemove =
    _wishlist.values.firstWhere((element) => _eqTwoItems(element, wishItem));
    await wishItemToRemove.delete();
  }

  Future<void> updateWishItem(WishItem oldWishItem, WishItem newWishItem) async {
    final wishItemToUpdate =
    _wishlist.values.firstWhere((element) => _eqTwoItems(element, oldWishItem));
    final index = wishItemToUpdate.key as int;
    await _wishlist.put(index, newWishItem);
  }

  bool _eqTwoItems(WishItem element, WishItem wishItem) {
    return element.title == wishItem.title &&
        element.link == wishItem.link &&
        element.selected == wishItem.selected;
  }
}
