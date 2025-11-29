import 'package:equatable/equatable.dart';

import 'customer.dart';
import 'employee.dart';

class Review extends Equatable {
  final String? id;
  final Employee? employee;
  final Customer? customer;
  final String? review;
  final int? rating;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Review({
    this.id,
    this.employee,
    this.customer,
    this.review,
    this.rating,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['_id'] as String?,
        employee: json['employee'] == null
            ? null
            : Employee.fromJson(json['employee'] as Map<String, dynamic>),
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer'] as Map<String, dynamic>),
        review: json['review'] as String?,
        rating: json['rating'] as int?,
        status: json['status'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'employee': employee?.toJson(),
        'customer': customer?.toJson(),
        'review': review,
        'rating': rating,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      employee,
      customer,
      review,
      rating,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
