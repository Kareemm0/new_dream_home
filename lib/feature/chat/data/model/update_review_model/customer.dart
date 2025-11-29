import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String? id;
  final String? name;

  const Customer({this.id, this.name});

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['_id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
