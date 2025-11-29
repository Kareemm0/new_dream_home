import 'package:equatable/equatable.dart';

import 'review.dart';

class ReviewModel extends Equatable {
  final String? message;
  final Review? review;

  const ReviewModel({this.message, this.review});

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        message: json['message'] as String?,
        review: json['review'] == null
            ? null
            : Review.fromJson(json['review'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'review': review?.toJson(),
      };

  @override
  List<Object?> get props => [message, review];
}
