import 'package:birthday_app/features/general/presentation/general/widgets/food-details-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/general/food.dart';
import '../../../blocs/food_bloc/food_bloc.dart';
import '../../../blocs/food_bloc/food_event.dart';
import '../../../blocs/food_bloc/food_state.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  final String folderLocate = 'assets/images/general/menu/';

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
                            imagePath: folderLocate + foodsList[index].filePath,
                            titleName: foodsList[index].name,
                            ingredients: foodsList[index].ingredients,
                          ),
                        ),
                      )
                    },
                    child: _SingleFoodCard(
                        imagePath: folderLocate + foodsList[index].filePath,
                        titleName: foodsList[index].name,
                        isEven: index % 2 == 0),
                  );
                },
              ),
              InkWell(
                onTap: () => {
                  BlocProvider.of<FoodBloc>(context).add(ChangeViewFoodsEvent(
                      foods: state.foods, gridCount: state.gridCount))
                },
                child: Text(
                  state.gridCount != 2 ? 'Свернуть ▲' : 'Развернуть ▼',
                  style: TextStyle(
                    color: const Color(0xFF171010),
                    fontSize: 14.sp,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                    ? BorderRadius.only(
                        topRight: const Radius.circular(20.0).r,
                        bottomLeft: const Radius.circular(20.0).r)
                    : BorderRadius.only(
                        topLeft: const Radius.circular(20.0).r,
                        bottomRight: const Radius.circular(20.0).r),
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
      ],
    );
  }
}
