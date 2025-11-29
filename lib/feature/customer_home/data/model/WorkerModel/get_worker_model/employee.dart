import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? role;
  final String? job;
  final dynamic images;
  final double? rate;
  final String? contactNumber;
  final int? v;

  const Employee({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.role,
    this.job,
    this.images,
    this.rate,
    this.contactNumber,
    this.v,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        role: json['role'] as String?,
        job: json['job'] as String?,
        images: json['images'] as dynamic,
        rate: (json['rate'] as num?)?.toDouble(),
        contactNumber: json['contactNumber'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'role': role,
        'job': job,
        'images': images,
        'rate': rate,
        'contactNumber': contactNumber,
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      password,
      role,
      job,
      images,
      rate,
      contactNumber,
      v,
    ];
  }
}
