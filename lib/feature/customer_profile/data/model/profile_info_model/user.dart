import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? role;
  final dynamic job;
  final String? contactNumber;
  final dynamic images;
  final dynamic rate;

  const User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.job,
    this.contactNumber,
    this.images,
    this.rate,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
        job: json['job'] as dynamic,
        contactNumber: json['contactNumber'] as String?,
        images: json['images'] as dynamic,
        rate: json['rate'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'role': role,
        'job': job,
        'contactNumber': contactNumber,
        'images': images,
        'rate': rate,
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
      contactNumber,
      images,
      rate,
    ];
  }
}
