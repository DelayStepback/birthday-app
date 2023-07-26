import 'package:birthday_app/features/general/data/models/general_data/food-data.dart';
import 'package:birthday_app/features/general/presentation/general/widgets/food-details-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/general/food.dart';

class MenuGrid extends StatefulWidget {
  const MenuGrid({super.key});

  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  late int gridCount;
  String folderLocate = 'assets/images/general/menu/';
  List<Food> foodList = FoodData().getFoodList();

  @override
  void initState() {
    gridCount = foodList.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            itemCount: gridCount,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodDetailsScreen(imagePath: folderLocate + foodList[index].filePath,
                            titleName: foodList[index].name, ingredients: foodList[index].ingredients,)))
                },
                child: SingleFoodCard(imagePath: folderLocate + foodList[index].filePath,
                    titleName: foodList[index].name, isEven: index % 2 == 0),
              );
            }),
        InkWell(
          onTap: () => setState(() {
            gridCount = gridCount != 2 ? 2 : foodList.length;
          }),
          child: Text(
            gridCount != 2 ? 'Свернуть ▲' : 'Развернуть ▼',
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
}
class SingleFoodCard extends StatelessWidget {
  final String imagePath;
  final String titleName;
  final bool isEven;
  const SingleFoodCard({super.key, required this.imagePath, required this.titleName, required this.isEven});

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
                      fit: BoxFit.cover,
                      image: AssetImage(
                          imagePath)),
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
