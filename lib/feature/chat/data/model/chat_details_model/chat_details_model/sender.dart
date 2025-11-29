import 'package:equatable/equatable.dart';

class Sender extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;

  const Sender({this.id, this.firstName, this.lastName, this.email});

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json['_id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      };

  @override
  List<Object?> get props => [id, firstName, lastName, email];
}
