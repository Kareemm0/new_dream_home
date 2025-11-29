import 'package:equatable/equatable.dart';

class Receiver extends Equatable {
  final String? id;
  final String? email;

  const Receiver({this.id, this.email});

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
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
