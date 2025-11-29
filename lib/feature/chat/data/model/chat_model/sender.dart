import 'package:equatable/equatable.dart';

class Sender extends Equatable {
  final String? id;
  final String? email;

  const Sender({this.id, this.email});

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
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
