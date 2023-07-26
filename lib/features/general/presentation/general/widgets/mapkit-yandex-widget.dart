import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapKitYandexWidget extends StatelessWidget {
  const MapKitYandexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
              height: 246,
              width: 343.w,
              child:
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(1),
                child: YandexMap(
                  mapObjects: [
                    PlacemarkMapObject(
                        mapId: const MapObjectId('1'),
                        point: const Point(latitude: 47.242516, longitude: 38.690101),
                        icon: PlacemarkIcon.single(
                          PlacemarkIconStyle(
                            image: BitmapDescriptor.fromAssetImage(
                                'assets/imageMap/baza.png'),
                          ),
                        ))
                  ],
                  onMapCreated: (YandexMapController controller) {
                    controller.moveCamera(
                      CameraUpdate.newCameraPosition(
                        const CameraPosition(
                          target:
                          Point(latitude: 47.242516, longitude: 38.690101),
                          zoom: 9,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ),
        ),
      ],
    );
  }
}
