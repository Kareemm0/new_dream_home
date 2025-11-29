import 'package:equatable/equatable.dart';

class User2 extends Equatable {
  final String? id;
  final String? email;

  const User2({this.id, this.email});

  factory User2.fromJson(Map<String, dynamic> json) => User2(
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
