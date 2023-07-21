import 'package:birthday_app/features/general/data/models/slider-image-model.dart';
import 'models/slider-image-model.dart';

class SliderData {
  static String _mainFolder = 'assets/images/general/image-slider-';
  List<SliderImageModel> _sliderList = [
    SliderImageModel(
        title: '25 августа\n2023', filePath: _mainFolder + "1.png"),
    SliderImageModel(
        title: 'Хорошая погода', filePath: _mainFolder + "2.png"),
    SliderImageModel(
        title: 'Новые знакомства', filePath: _mainFolder + "3.png"),
    SliderImageModel(
        title: '25 августа\n2023', filePath: _mainFolder + "4.png"),
  ];

  List<SliderImageModel> getSliderList() {
    return _sliderList;
  }
}
