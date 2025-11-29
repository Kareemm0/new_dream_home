import 'package:equatable/equatable.dart';

class User1 extends Equatable {
  final String? id;
  final String? email;

  const User1({this.id, this.email});

  factory User1.fromJson(Map<String, dynamic> json) => User1(
        id: json['_id'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
      };

  @override
  List<Object?> get props => [id, email];
}
