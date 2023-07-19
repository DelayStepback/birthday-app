import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuGrid extends StatefulWidget {
  const MenuGrid({super.key});

  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  late int gridCount;

  String folderLocate = 'assets/images/general/menu/';
  List<String> foodUrls = [
    "1.jpg", "2.png", "3.jpg", "4.png", "5.jpg", "6.jpg"
  ];
  List<String> foodNames = [
    "Канапе",
    "Сырная тарелка",
    "Шашлык на мангале",
    "Морепродукты",
    "Свежие фрукты",
    "Авторские лимонады"
  ];

  @override
  void initState() {
    gridCount = 6;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0, mainAxisSpacing: 0,
              crossAxisCount: 2,
            ),
            itemCount: gridCount,
            itemBuilder: (BuildContext ctx, index) {
              return Column(children: [
                Container(
                  height: 140.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(folderLocate + foodUrls[index])),
                    borderRadius: index % 2 == 0 ? BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)) :
                    BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                    child: Text(foodNames[index], textAlign: TextAlign.left,

                      style: TextStyle(
                        color: Color(0xFF4D4242),
                        fontSize: 14.w,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w400,

                      ),),
                  ),
                ),
              ]);
            }),

        InkWell(
          onTap: () =>
              setState(() {
                gridCount = gridCount != 2 ? 2 : 6;
              }),
          child: Text(
            gridCount != 2 ? 'Свернуть ▲' : 'Развернуть ▼',
            style: TextStyle(
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
