
import 'package:birthday_app/features/general/data/models/entertainments.dart';

class EntertainmentsData{
  static final String _mainFolder = 'assets/images/general/entertainments/';
  final List<Entertainments> _entertainmentsList = [
    Entertainments(title: 'Настольные игры', description: 'Мафия, уно, домино, экивоки и другие',
        imagePath: _mainFolder + 'cardgames.png'),
    Entertainments(title: 'Бассейн', description: 'Два бассейна с подогревом',
        imagePath: _mainFolder + 'swimming.png' ),
    Entertainments(title: 'Песни под гитару', description: 'Посидим, как в детстве',
        imagePath: _mainFolder + 'cardgames.png'),
    Entertainments(title: 'Проектор и кино', description: 'Фильмы на свежем воздухе',
        imagePath: _mainFolder + 'swimming.png'),
    Entertainments(title: 'Фейерверки', description: 'Запомним этот день яркими воспоминаниями!',
        imagePath: _mainFolder+ 'cardgames.png'),
  ];
  List<Entertainments> getEntertainmentsList() {
    return _entertainmentsList;
  }
}

