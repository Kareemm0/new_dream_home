import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? role;
  final dynamic job;
  final dynamic images;
  final double? rate;
  final String? contactNumber;
  final int? v;

  const User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.job,
    this.images,
    this.rate,
    this.contactNumber,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
        job: json['job'] as dynamic,
        images: json['images'] as dynamic,
        rate: json['rate'] as double?,
        contactNumber: json['contactNumber'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
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
      role,
      job,
      images,
      rate,
      contactNumber,
      v,
    ];
  }
}
