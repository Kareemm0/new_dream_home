import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String? id;
  final String? name;

  const Employee({this.id, this.name});

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
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
