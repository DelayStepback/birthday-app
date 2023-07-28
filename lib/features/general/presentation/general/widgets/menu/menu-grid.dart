import 'package:birthday_app/features/general/data/blocs/food_bloc/food_event.dart';
import 'package:birthday_app/features/general/presentation/general/widgets/food-details-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/blocs/bloc_exports.dart';
import '../../../../data/blocs/food_bloc/food_bloc.dart';
import '../../../../data/blocs/food_bloc/food_state.dart';
import '../../../../data/models/general/food.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  final String folderLocate = 'assets/images/general/menu/';

  // List<Food> foodList = FoodData().getFoodList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoadingState) {
          BlocProvider.of<FoodBloc>(context).add(LoadFoodEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FoodLoadedState) {
          List<Food> foodsList = state.foods;
          return Column(
            children: [
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 28.w,
                    childAspectRatio: 0.82,
                    crossAxisCount: 2,
                  ),
                  itemCount: state.gridCount,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodDetailsScreen(
                                      imagePath: folderLocate +
                                          foodsList[index].filePath,
                                      titleName: foodsList[index].name,
                                      ingredients: foodsList[index].ingredients,
                                    )))
                      },
                      child: _SingleFoodCard(
                          imagePath: folderLocate + foodsList[index].filePath,
                          titleName: foodsList[index].name,
                          isEven: index % 2 == 0),
                    );
                  }),
              InkWell(
                onTap: () => {
                  print('grid ${state.gridCount}'),
                  BlocProvider.of<FoodBloc>(context).add(ChangeViewFoodsEvent(
                      foods: foodsList,
                      gridCount: state.gridCount != 2 ? 2 : foodsList.length))
                },
                child: Text(
                  state.gridCount != 2 ? 'Свернуть ▲' : 'Развернуть ▼',
                  style: const TextStyle(
                    color: Color(0xFF171010),
                    fontSize: 14,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          );
        }
        if (state is FoodErrorState) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        return Container();
      },
    );
  }
}

class _SingleFoodCard extends StatelessWidget {
  final String imagePath;
  final String titleName;
  final bool isEven;

  const _SingleFoodCard(
      {super.key,
      required this.imagePath,
      required this.titleName,
      required this.isEven});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 140.w,
            width: 140.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagePath)),
              borderRadius: isEven
                  ? const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0))
                  : const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
            ),
          ),
        ],
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: Text(
            titleName,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: const Color(0xFF4D4242),
              fontSize: 14.sp,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ]);
  }
}
