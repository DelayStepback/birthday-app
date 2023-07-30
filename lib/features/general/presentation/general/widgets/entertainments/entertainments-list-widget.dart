import 'package:birthday_app/features/general/data/blocs/entertainments_bloc/entertainments_event.dart';
import 'package:birthday_app/features/general/data/models/general/entertainments.dart';
import 'package:flutter/material.dart';

import '../../../../data/blocs/bloc_exports.dart';
import '../../../../data/blocs/entertainments_bloc/entertainments_bloc.dart';
import '../../../../data/blocs/entertainments_bloc/entertainments_state.dart';
import 'entertainments-tile.dart';

class EntertainmentsListView extends StatelessWidget {
  const EntertainmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntertainmentsBloc, EntertainmentsState>(
      builder: (context, state) {
        if (state is EntertainmentsLoadingState) {
          BlocProvider.of<EntertainmentsBloc>(context)
              .add(LoadEntertainmentsEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is EntertainmentsLoadedState) {
          List<Entertainments> entertainmentsList = state.entertainments;
          return Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.listCount,
                  itemBuilder: (context, index) => EntertainmentsTile(
                      title: entertainmentsList[index].title,
                      description: entertainmentsList[index].description,
                      imagePath: entertainmentsList[index].imagePath)),
              InkWell(
                onTap: () => {
                  BlocProvider.of<EntertainmentsBloc>(context).add(ChangeViewEntertainmentsEvent(
                      entertainments: state.entertainments,
                      listCount: state.listCount))
                },
                child: Text(
                  state.listCount != 2 ? 'Свернуть ▲' : 'Развернуть ▼',
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
        if (state is EntertainmentsErrorState) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        return Container();
      },
    );
  }
}
