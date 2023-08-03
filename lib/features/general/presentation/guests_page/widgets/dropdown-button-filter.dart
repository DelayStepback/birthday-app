import 'package:birthday_app/features/general/presentation/blocs/guests_bloc/guests_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/guests_bloc/guests_bloc.dart';
import '../../blocs/guests_bloc/guests_state.dart';

const List<String> list = <String>[
  'По дате записи',
  'По имени',
  'По фамилии',
  'По возрасту',
  'По дате рождения',
  'По профессии',
];

class DropdownButtonFilter extends StatefulWidget {
  const DropdownButtonFilter({super.key});

  @override
  State<DropdownButtonFilter> createState() => _DropdownButtonFilterState();
}

class _DropdownButtonFilterState extends State<DropdownButtonFilter> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuestsBloc, GuestsState>(
      builder: (context, state) {
        return DropdownButton<String>(
          itemHeight: 48,
          value: dropdownValue,
          icon: const Text('▼'),
          elevation: 0,
          style: TextStyle(
            color: const Color(0xFF171010),
            fontSize: 14.sp,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w400,
          ),
          underline: Container(
            height: 1,
            color: Colors.black,
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
            if (state is GuestsLoadedState){
            context
                .read<GuestsBloc>()
                .add(FilterGuestsEvent(guests: state.allGuests, filter: list.indexOf(dropdownValue)));
            }

          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
