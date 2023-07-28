import 'package:birthday_app/features/general/data/blocs/food_bloc/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'features/general/data/blocs/bloc_exports.dart';
import 'features/general/domain/repository/food/food-repository.dart';
import 'features/general/presentation/general/general-screen.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return RepositoryProvider(
          create: (context) => FoodRepository(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
              create: (context) => GuestsBloc(),
              ),
              BlocProvider(create: (context) => FoodBloc(RepositoryProvider.of<FoodRepository>(context)))
            ],

            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Birthday App',
              // You can use the library anywhere in the app even in theme
              theme: ThemeData(
                // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              ),
              home: child,
            ),
          ),
        );
      },
      child: const GeneralScreen(),
    );
  }
}
