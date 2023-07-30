import 'package:birthday_app/features/general/data/blocs/slider_bloc/slider_event.dart';
import 'package:birthday_app/features/general/data/blocs/slider_bloc/slider_state.dart';
import 'package:bloc/bloc.dart';
import '../../../domain/repository/slider/slider-repository.dart';


class SliderBloc extends Bloc<SliderEvent, SliderState> {
  final SliderRepository _sliderRepository;

  SliderBloc(this._sliderRepository) : super(SliderLoadingState()) {
    on<LoadSliderEvent>(_onLoadSliderEvent);
    on<ChangeActivePageEvent>(_onChangeActivePageEvent);
  }

  Future<void> _onLoadSliderEvent(event,emit) async {
    emit(SliderLoadingState());
    try {
      final sliders = await _sliderRepository.loadSliderCatalog();
      emit(SliderLoadedState(sliders, 0));
    } catch (e) {
      emit(SliderErrorState(e.toString()));
    }
  }

  void _onChangeActivePageEvent(ChangeActivePageEvent event, emit) {
    emit(SliderLoadedState(event.sliders, event.currPage));
  }
}
