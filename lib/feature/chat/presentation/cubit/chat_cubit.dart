import 'dart:developer';
import 'package:dream_home/core/cache/user_info_cache.dart';
import 'package:dream_home/feature/chat/data/model/review_model/review_model.dart';
import 'package:dream_home/feature/chat/domin/repo/chat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/chat_details_model/chat_details_model/chat_details_model.dart';
import '../../data/model/chat_model/chat_model.dart';
import '../../data/model/get_review_model/get_review_model.dart';
import '../../data/model/update_review_model/update_review_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _repo;
  ChatCubit(this._repo) : super(ChatInitial());

  ChatModel? chatModel;
  ChatDetailsModel? chatDetailsModel;
  ReviewModel? reviewModel;
  int selectedRating = 0;
  UpdateReviewModel? updateReviewModel;
  List<GetReviewModel> getReviewModel = [];
  String reviewStatus = '';

  final TextEditingController messageController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  Future<void> getAllChats({required String userid}) async {
    emit(GetAllChatsLoadingState());
    final result = await _repo.getAllChats(userid: userid);
    result.fold((l) => emit(GetAllFailureState(l.message)), (r) {
      chatModel = r;
      emit(GetAllChatsSuccessState(r));
    });
  }

  Future<void> getChatMessages({
    required String senderId,
    required String receiverId,
  }) async {
    emit(GetAllChatMessagesLoadingState());
    final result = await _repo.getChatMessages(
      senderId: senderId,
      receiverId: receiverId,
    );
    result.fold((l) => emit(GetAllChatMessagesFailureState(l.message)), (r) {
      chatDetailsModel = r;
      emit(GetAllChatMessagesSuccessState(r));
    });
  }

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String message,
  }) async {
    emit(SendMessageLoadingState());
    final result = await _repo.sendMessage(
      senderId: senderId,
      receiverId: receiverId,
      message: message,
    );
    result.fold((l) => emit(SendMessageFailureState(l.message)), (r) {
      messageController.clear();
      getChatMessages(
        senderId: senderId,
        receiverId: receiverId,
      );
      emit(SendMessageSuccessState());
    });
  }

  Future<void> requestReview({
    required String employeeId,
    required String customerId,
  }) async {
    final result = await _repo.requestReview(
      employeeId: employeeId,
      customerId: customerId,
    );
    result.fold((l) => emit(RequestReviewFailureState(l.message)), (r) async {
      reviewModel = r;

      reviewStatus = r.review!.status!;
      await saveReviewId(r.review!.id!);
      log("=================${r.review!.id}");
      log("review Status =================${r.review!.status}");

      reviewModel = r;
      emit(RequestReviewSuccessState(r));
    });
  }

  Future<void> updateReview({
    required String reviewId,
  }) async {
    final result = await _repo.updateReview(
      reviewId: reviewId,
      review: reviewController.text,
      rating: selectedRating,
    );
    result.fold((l) => emit(UpdateReviewFailureState(l.message)), (r) async {
      updateReviewModel = r;
      await saveReviewStatus(r.review!.status!);
      log("=================${r.review!.status}");
      emit(UpdateReviewSuccessState(r));
    });
  }

  Future<void> getReview({required String employeeId}) async {
    final result = await _repo.getReviews(employeeId: employeeId);
    result.fold(
        (l) => emit(
              GetReviewsFailureState(l.message),
            ), (r) async {
      getReviewModel = r;
      log("getReviewModel length=============================================${getReviewModel.length}");
      log("getReviewModel =============================================$getReviewModel");

      emit(GetReviewsSuccessState(r));
    });
  }
}
