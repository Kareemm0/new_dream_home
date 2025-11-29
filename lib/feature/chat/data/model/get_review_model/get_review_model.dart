import 'package:equatable/equatable.dart';

class GetReviewModel extends Equatable {
  final String? id;
  final String? employeeId;
  final String? customerId;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? rating;
  final String? review;

  const GetReviewModel({
    this.id,
    this.employeeId,
    this.customerId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rating,
    this.review,
  });

  factory GetReviewModel.fromJson(Map<String, dynamic> json) {
    return GetReviewModel(
      id: json['_id'] as String?,
      employeeId: json['employeeId'] as String?,
      customerId: json['customerId'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      rating: json['rating'] as int?,
      review: json['review'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'employeeId': employeeId,
        'customerId': customerId,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'rating': rating,
        'review': review,
      };

  @override
  List<Object?> get props {
    return [
      id,
      employeeId,
      customerId,
      status,
      createdAt,
      updatedAt,
      v,
      rating,
      review,
    ];
  }
}
