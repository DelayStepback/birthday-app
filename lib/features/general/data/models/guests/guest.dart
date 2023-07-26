import 'package:equatable/equatable.dart';
class Guest extends Equatable{

  final String firstName;
  final String lastName;
  final DateTime birthdayDate;
  final DateTime createdTime;
  final String phone;
  final String profession;

  const Guest({
    required this.firstName,
    required this.lastName,
    required this.birthdayDate,
    required this.createdTime,
    required this.phone,
    required this.profession,
  });

  Guest copyWith({
    required final String firstName,
    required final String lastName,
    required final DateTime birthdayDate,
    required final DateTime createdTime,
    required final String phone,
    required final String profession,
  }) {
    return Guest(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthdayDate: birthdayDate ?? this.birthdayDate,
      createdTime: createdTime ?? this.createdTime,
      phone: phone ?? this.phone,
      profession: profession ?? this.profession,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
  firstName,
  lastName,
  birthdayDate,
  createdTime,
  phone,
  profession,
  ];
}