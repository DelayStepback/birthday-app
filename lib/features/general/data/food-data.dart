import 'models/food.dart';

class FoodData{
  final List<Food> _foodList = [
    Food(name: 'Канапе', filePath: "1.jpg", ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
    Food(name: 'Сырная тарелка', filePath: "2.png", ingredients: ['Сыр', 'Сыр', 'Сыр', 'Сыр', 'И ещё немного сыра']),
    Food(name: 'Шашлык на мангале', filePath: "3.jpg", ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
    Food(name: 'Морепродукты', filePath: "4.png", ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
    Food(name: 'Свежие фрукты', filePath: "5.jpg", ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
    Food(name: 'Авторские лимонады', filePath: "6.jpg", ingredients: ['Хлеб', 'Ветчина', 'Салат', 'Яйцо']),
  ];
  List<Food> getFoodList() {
    return _foodList;
  }
}