import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'guest.g.dart';

@HiveType(typeId: 0)
class Guest extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final DateTime birthdayDate;
  @HiveField(3)
  final DateTime createdTime;
  @HiveField(4)
  final String phone;
  @HiveField(5)
  final String profession;
  @HiveField(6)
  late String id;

  Guest({
    required this.firstName,
    required this.lastName,
    required this.birthdayDate,
    required this.createdTime,
    required this.phone,
    required this.profession,
    this.id = '',
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

  Map<String, dynamic> toJson() =>
      {
        'firstName': firstName,
        'lastName': lastName,
        'birthdayDate': birthdayDate,
        'createdTime': createdTime,
        'phone': phone,
        'profession': profession,
        'id': id,
      };

  static Guest fromJson(Map<String, dynamic> json) =>
      Guest(firstName: json['firstName'],
          lastName: json['lastName'],
          birthdayDate: json['birthdayDate'],
          createdTime: json['createdTime'],
          phone: json['phone'],
          profession: json['profession'],
          id: json['id'],
      );

  @override
  List<Object?> get props =>
      [
        firstName,
        lastName,
        birthdayDate,
        createdTime,
        phone,
        profession,
      ];
}
