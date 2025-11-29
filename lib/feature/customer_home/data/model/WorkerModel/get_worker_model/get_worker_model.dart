import 'package:equatable/equatable.dart';

import 'employee.dart';

class GetWorkerModel extends Equatable {
  final List<Employee>? employees;

  const GetWorkerModel({this.employees});

  factory GetWorkerModel.fromJson(Map<String, dynamic> json) {
    return GetWorkerModel(
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) => Employee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'employees': employees?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [employees];
}
