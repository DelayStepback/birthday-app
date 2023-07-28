import '../../../data/models/general/food.dart';

const _delay = Duration(milliseconds: 5000);

List<Food> _foodCatalog = [
  Food(
      name: 'Канапе',
      filePath: "1.jpg",
      ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
  Food(
      name: 'Сырная тарелка',
      filePath: "2.png",
      ingredients: ['Сыр', 'Сыр', 'Сыр', 'Сыр', 'И ещё немного сыра']),
  Food(
      name: 'Шашлык на мангале',
      filePath: "3.jpg",
      ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
  Food(
      name: 'Морепродукты',
      filePath: "4.png",
      ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
  Food(
      name: 'Свежие фрукты',
      filePath: "5.jpg",
      ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
  Food(
      name: 'Авторские лимонады',
      filePath: "6.jpg",
      ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
];

class FoodRepository {
  Future<List<Food>> loadFoodCatalog() =>
      Future.delayed(_delay, () => _foodCatalog);
}
