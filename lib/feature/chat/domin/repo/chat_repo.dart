import 'package:dartz/dartz.dart';
import 'package:dream_home/core/network/error/failure.dart';
import 'package:dream_home/feature/chat/data/model/chat_details_model/chat_details_model/chat_details_model.dart';
import 'package:dream_home/feature/chat/data/model/chat_model/chat_model.dart';
import 'package:dream_home/feature/chat/data/model/get_review_model/get_review_model.dart';
import 'package:dream_home/feature/chat/data/model/review_model/review_model.dart';

import '../../data/model/Send_message_model/send_message_model/send_message_model.dart';
import '../../data/model/update_review_model/update_review_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, ChatModel>> getAllChats({
    required String userid,
  });

  Future<Either<Failure, ChatDetailsModel>> getChatMessages({
    required String senderId,
    required String receiverId,
  });

  Future<Either<Failure, SendMessageModel>> sendMessage({
    required String senderId,
    required String receiverId,
    required String message,
  });

  Future<Either<Failure, ReviewModel>> requestReview({
    required String employeeId,
    required String customerId,
  });

  Future<Either<Failure, UpdateReviewModel>> updateReview({
    required String reviewId,
    required String review,
    required int rating,
  });

  Future<Either<Failure, List<GetReviewModel>>> getReviews(
      {required String employeeId});
}
