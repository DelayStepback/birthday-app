import 'package:birthday_app/features/general/data/models/general/slider-image-model.dart';
import 'package:equatable/equatable.dart';

class SliderState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SliderLoadingState extends SliderState{
  @override
  List<Object?> get props => [];
}

class SliderLoadedState extends SliderState{
  final List<SliderImageModel> sliders;
  final int currPage;
  SliderLoadedState(this.sliders,this.currPage);
  @override
  List<Object?> get props => [sliders,currPage];
}

class SliderErrorState extends SliderState{
  final String error;
  SliderErrorState(this.error);
  @override
  List<Object?> get props => [error];
}


