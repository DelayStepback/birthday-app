import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'wishitem.g.dart';

@HiveType(typeId: 1)
class WishItem extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String link;
  @HiveField(2)
  final bool selected;

  WishItem({
    required this.title,
    required this.link,
    required this.selected,
  });

  WishItem copyWith({
    String? title,
    String? link,
    bool? selected,
  }) {
    return WishItem(
      title: title ?? this.title,
      link: link ?? this.link,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [
        title,
        link,
        selected,
      ];
}
