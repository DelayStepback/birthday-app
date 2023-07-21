import 'package:birthday_app/features/general/data/food-data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/food.dart';

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
                onTap: ()=>{},
                child: Column(
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
                              image: AssetImage(folderLocate + foodList[index].filePath)),
                          borderRadius: index % 2 == 0 ? const BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0)) :
                          const BorderRadius.only(
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
                      child: Text(foodList[index].name, textAlign: TextAlign.left,

                        style: TextStyle(
                          color: const Color(0xFF4D4242),
                          fontSize: 14.sp,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400,

                        ),),
                    ),
                  ),
                ]),
              );
            }),
        InkWell(
          onTap: () =>
              setState(() {
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
