import 'package:birthday_app/features/general/data/blocs/bloc/guests_event.dart';
import 'package:birthday_app/features/general/presentation/guests_page/widgets/guests-list-widget.dart';
import 'package:birthday_app/features/general/presentation/guests_page/widgets/text-input-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../general/data/blocs/bloc/guests_state.dart';
import '../../../general/data/blocs/bloc_exports.dart';
import '../../../general/data/models/guests/guest.dart';

class GuestsPage extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
      selectedDate = picked;
    }
  }

  void _addGuest(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        context: context,
        builder: (context) => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 633.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Dialog(
                      elevation: 0,
                      insetPadding: const EdgeInsets.all(0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            TextInputField(
                                textEditingController: firstNameController,
                                labelText: 'Имя',
                                autofocus: true),
                            SizedBox(
                              height: 12.h,
                            ),
                            TextInputField(
                                textEditingController: lastNameController,
                                labelText: 'Фамилия',
                                autofocus: false),
                            SizedBox(
                              height: 12.h,
                            ),
                            ElevatedButton(
                              onPressed: () => _selectDate(context),
                              child: const Text('Select date'),
                            ),
                            TextInputField(
                                textEditingController: phoneController,
                                labelText: 'Телефон',
                                autofocus: false),
                            TextInputField(
                                textEditingController: professionController,
                                labelText: 'Профессия',
                                autofocus: false),
                            SizedBox(
                              height: 50.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                var guest = Guest(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  birthdayDate: selectedDate,
                                  createdTime: DateTime.now(),
                                  phone: phoneController.text,
                                  profession: professionController.text,
                                );
                                context
                                    .read<GuestsBloc>()
                                    .add(AddGuest(guest: guest));
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 156,
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF47802B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Записаться',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: const Color(0xFF47802B),
                  shape: const CircleBorder(),
                ),
              ),
            ));
      },
    );
  }
}
