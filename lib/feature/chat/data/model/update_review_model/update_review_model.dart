import 'package:equatable/equatable.dart';

import 'review.dart';

class UpdateReviewModel extends Equatable {
  final String? message;
  final Review? review;

  const UpdateReviewModel({this.message, this.review});

  factory UpdateReviewModel.fromJson(Map<String, dynamic> json) {
    return UpdateReviewModel(
      message: json['message'] as String?,
      review: json['review'] == null
          ? null
          : Review.fromJson(json['review'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'review': review?.toJson(),
      };

  @override
  List<Object?> get props => [message, review];
}
