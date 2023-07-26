import 'package:birthday_app/features/general/data/blocs/bloc/guests_event.dart';
import 'package:birthday_app/features/general/presentation/guests_page/widgets/guests-list-widget.dart';
import 'package:birthday_app/features/general/presentation/guests_page/widgets/text-input-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/data/blocs/bloc/guests_state.dart';
import '../../../general/data/blocs/bloc_exports.dart';
import '../../../general/data/models/guests/guest.dart';

class GuestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GuestsBloc()
        ..add(AddGuest(
          guest: Guest(
              firstName: 'Valeeera',
              lastName: 'Stateneal',
              birthdayDate: DateTime(2002, 8, 1),
              createdTime: DateTime.now(),
              phone: '+7903243',
              profession: 'programmer'),
        )),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController professionController = TextEditingController();


  late TextEditingController textEditingController;
  late String labelText;


  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: selectedDate);
    if (picked != null && picked != selectedDate) {
      // setState(() {
      //   selectedDate = picked;
      // });
    }
  }

  void _addGuest(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        context: context,
        builder: (context) => SingleChildScrollView(
          padding: EdgeInsets.all(16),
              child: SizedBox(
                height: 633.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.all(0),
                      child: SizedBox(

                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(height: 20.sp,),
                            TextInputField(textEditingController: firstNameController, labelText: 'Имя'),
                            SizedBox(height: 12.sp,),
                            TextInputField(textEditingController: lastNameController, labelText: 'Фамилия'),
                            SizedBox(height: 12.sp,),
                            ElevatedButton(
                              onPressed: () => _selectDate(context),
                              child: const Text('Select date'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<GuestsBloc>(context);
    // List<Guest> guestList = [
    //   Guest(
    //       firstName: 'Ivan',
    //       lastName: 'Stateneal',
    //       birthdayDate: DateTime(2002, 8, 1),
    //       createdTime: DateTime.now(),
    //       phone: '+7903243',
    //       profession: 'programmer'),
    //   Guest(
    //       firstName: 'Dima',
    //       lastName: 'Stateneal',
    //       birthdayDate: DateTime(2002, 8, 1),
    //       createdTime: DateTime.now(),
    //       phone: '+7903243',
    //       profession: 'programmer'),
    //   Guest(
    //       firstName: 'Senya',
    //       lastName: 'Stateneal',
    //       birthdayDate: DateTime(2002, 8, 1),
    //       createdTime: DateTime.now(),
    //       phone: '+7903243',
    //       profession: 'programmer'),
    //   Guest(
    //       firstName: 'Grigory',
    //       lastName: 'Stateneal',
    //       birthdayDate: DateTime(2002, 8, 1),
    //       createdTime: DateTime.now(),
    //       phone: '+7903243',
    //       profession: 'programmer'),
    // ];

    return BlocBuilder<GuestsBloc, GuestsState>(
      builder: (context, state) {
        List<Guest> guestsList = state.allGuests;
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 48,
              leading: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                  color: Color(0xFFC0C0CA),
                ),
                onTap: () => Navigator.pop(context),
              ),
              title: Text(
                'Список гостей',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: GuestsList(guestList: guestsList),
            floatingActionButton: Container(
              width: 84.w,
              height: 84.w,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () => _addGuest(context),
                  child: const Icon(
                    Icons.add,
                    size: 56,
                  ),
                  backgroundColor: Color(0xFF47802B),
                  shape: CircleBorder(),
                ),
              ),
            ));
      },
    );
  }
}
