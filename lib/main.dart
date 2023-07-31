import 'package:birthday_app/features/general/data/services/guests-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'features/general/data/repository/entertainments/entertainments-repository.dart';
import 'features/general/data/repository/food/food-repository.dart';
import 'features/general/data/repository/slider/slider-repository.dart';
import 'features/general/presentation/blocs/entertainments_bloc/entertainments_bloc.dart';
import 'features/general/presentation/blocs/food_bloc/food_bloc.dart';
import 'features/general/presentation/blocs/guests_bloc/guests_bloc.dart';
import 'features/general/presentation/blocs/slider_bloc/slider_bloc.dart';
import 'features/general/presentation/general/general-screen.dart';

Future<void> main() async {
  AndroidYandexMap.useAndroidViewSurface = false;
  await Hive.initFlutter();
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
            RepositoryProvider(create: (context) => GuestsService()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GuestsBloc(RepositoryProvider.of<GuestsService>(context)),
              ),
              BlocProvider(
                  create: (context) =>
                      FoodBloc(RepositoryProvider.of<FoodRepository>(context))),
              BlocProvider(
                  create: (context) => EntertainmentsBloc(
                      RepositoryProvider.of<EntertainmentsRepository>(
                          context))),
              BlocProvider(
                  create: (context) => SliderBloc(
                      RepositoryProvider.of<SliderRepository>(context))),
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
