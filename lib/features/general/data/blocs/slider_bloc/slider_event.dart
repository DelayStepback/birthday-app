import 'package:equatable/equatable.dart';

import '../../models/general/slider-image-model.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();
}

class LoadSliderEvent extends SliderEvent {
  @override
  List<Object?> get props => [];
}

class ChangeActivePageEvent extends SliderEvent {
  final List<SliderImageModel> sliders;
  final int currPage;
  const ChangeActivePageEvent(this.sliders,this.currPage);
  @override
  List<Object?> get props => [sliders, currPage];
}