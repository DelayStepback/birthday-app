import 'package:birthday_app/features/general/presentation/guests_page/widgets/text-input-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../data/models/guests/guest.dart';
import '../../blocs/guests_bloc/guests_bloc.dart';
import '../../blocs/guests_bloc/guests_event.dart';class AddGuestModalMenu extends StatefulWidget {
  final String action;
  final Guest? oldGuest;

  const AddGuestModalMenu({super.key, required this.action, this.oldGuest});

  @override
  State<AddGuestModalMenu> createState() => _AddGuestModalMenuState();
}

class _AddGuestModalMenuState extends State<AddGuestModalMenu> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthdayDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  String birthdayDate = 'Дата рождения';

  @override
  void initState() {
    if (widget.action == 'update') {
      firstNameController.text = widget.oldGuest!.firstName;
      lastNameController.text = widget.oldGuest!.lastName;
      phoneController.text = widget.oldGuest!.phone;
      professionController.text = widget.oldGuest!.profession;
      selectedDate = widget.oldGuest!.birthdayDate;
      birthdayDate = DateFormat('dd-MM-yyyy').format(selectedDate);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 633.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Dialog(
            elevation: 0,
            insetPadding: const EdgeInsets.all(0),
            child: SizedBox(
              height: 633.h,
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
                Container(
                  color: Color(0xFFF2F8EF),
                  height: 61.sp,
                  padding: EdgeInsets.only(top: 8.h, left: 12.w, right: 12.w, bottom: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(birthdayDate, style: TextStyle(
                        color: Color(0xFF171010),
                        fontSize: birthdayDate == 'Дата рождения'? 13: 16,
                        fontFamily: 'Jost',
                        fontWeight: birthdayDate == 'Дата рождения'? FontWeight.w400 : FontWeight.w500,
                      ),),
                      IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: () => _selectDate(context),
                      ),
                    ],
                  ),
                ),
                  SizedBox(
                    height: 12.h,
                  ),

                  TextInputField(
                      textEditingController: phoneController,
                      labelText: 'Телефон',
                      autofocus: false),
                  SizedBox(
                    height: 12.h,
                  ),

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
                      if (widget.action == 'create') {
                        context.read<GuestsBloc>().add(AddGuest(guest: guest));
                        Navigator.pop(context);
                      }
                      if (widget.action == 'update') {
                        context.read<GuestsBloc>().add(UpdateGuest(
                            guest: widget.oldGuest!, newStateGuest: guest));
                        Navigator.pop(context);
                      }
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
    );
  }
}
