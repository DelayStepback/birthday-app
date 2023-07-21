import 'package:birthday_app/features/general/data/entertainments-data.dart';
import 'package:birthday_app/features/general/data/models/entertainments.dart';
import 'package:flutter/material.dart';

import 'entertainments-tile.dart';

class EntertainmentsListView extends StatefulWidget {
  const EntertainmentsListView({super.key});

  @override
  State<EntertainmentsListView> createState() => _EntertainmentsListViewState();
}

class _EntertainmentsListViewState extends State<EntertainmentsListView> {
  final List<Entertainments> entertainmentsList =
      EntertainmentsData().getEntertainmentsList();
  late int listCount;

  @override
  void initState() {
    // TODO: implement initState
    listCount = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listCount,
            itemBuilder: (context, index) => EntertainmentsTile(
                title: entertainmentsList[index].title,
                description: entertainmentsList[index].description,
                imagePath: entertainmentsList[index].imagePath)),
        InkWell(
          onTap: () => setState(() {
            listCount = listCount != 2 ? 2 : entertainmentsList.length;
          }),
          child: Text(
            listCount != 2 ? 'Свернуть ▲' : 'Развернуть ▼',
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
