import '../../../data/models/general/slider-image-model.dart';

const _delay = Duration(milliseconds: 2000);

const String _mainFolder = 'assets/images/general/image-slider-';

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

class SliderRepository {
  Future<List<SliderImageModel>> loadSliderCatalog() =>
      Future.delayed(_delay, () => _sliderList);
}
