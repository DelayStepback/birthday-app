import 'package:birthday_app/features/general/data/blocs/entertainments_bloc/entertainments_bloc.dart';
import 'package:birthday_app/features/general/data/blocs/food_bloc/food_bloc.dart';
import 'package:birthday_app/features/general/domain/repository/entertainments/entertainments-repository.dart';
import 'package:birthday_app/features/general/domain/repository/slider/slider-repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'features/general/data/blocs/bloc_exports.dart';
import 'features/general/data/blocs/slider_bloc/slider_bloc.dart';
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
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => FoodRepository()),
            RepositoryProvider(create: (context) => EntertainmentsRepository()),
            RepositoryProvider(create: (context) => SliderRepository()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GuestsBloc(),
              ),
              BlocProvider(
                  create: (context) =>
                      FoodBloc(RepositoryProvider.of<FoodRepository>(context))),
              BlocProvider(
                  create: (context) =>
                      EntertainmentsBloc(RepositoryProvider.of<EntertainmentsRepository>(context))),
              BlocProvider(
                  create: (context) =>
                      SliderBloc(RepositoryProvider.of<SliderRepository>(context))),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Birthday App',
              home: child,
            ),
          ),
        );
      },
      child: const GeneralScreen(),
    );
  }
}
