part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class GetAllChatsLoadingState extends ChatState {}

final class GetAllChatsSuccessState extends ChatState {
  final ChatModel chats;

  const GetAllChatsSuccessState(this.chats);

  @override
  List<Object> get props => [chats];
}

final class GetAllFailureState extends ChatState {
  final String error;

  const GetAllFailureState(this.error);

  @override
  List<Object> get props => [error];
}

final class GetAllChatMessagesLoadingState extends ChatState {}

final class GetAllChatMessagesSuccessState extends ChatState {
  final ChatDetailsModel chatDetails;

  const GetAllChatMessagesSuccessState(this.chatDetails);

  @override
  List<Object> get props => [chatDetails];
}

final class GetAllChatMessagesFailureState extends ChatState {
  final String error;

  const GetAllChatMessagesFailureState(this.error);

  @override
  List<Object> get props => [error];
}

final class SendMessageLoadingState extends ChatState {}

final class SendMessageSuccessState extends ChatState {
  const SendMessageSuccessState();
}

final class SendMessageFailureState extends ChatState {
  final String error;

  const SendMessageFailureState(this.error);

  @override
  List<Object> get props => [error];
}

final class RequestReviewLoadingState extends ChatState {}

final class RequestReviewSuccessState extends ChatState {
  final ReviewModel review;
  const RequestReviewSuccessState(this.review);

  @override
  List<Object> get props => [review];
}

final class RequestReviewFailureState extends ChatState {
  final String error;

  const RequestReviewFailureState(this.error);

  @override
  List<Object> get props => [error];
}

final class UpdateReviewLoadingState extends ChatState {}

final class UpdateReviewSuccessState extends ChatState {
  final UpdateReviewModel review;
  const UpdateReviewSuccessState(this.review);

  @override
  List<Object> get props => [review];
}

final class UpdateReviewFailureState extends ChatState {
  final String error;

  const UpdateReviewFailureState(this.error);

  @override
  List<Object> get props => [error];
}

final class GetReviewsLoadingState extends ChatState {}

final class GetReviewsSuccessState extends ChatState {
  final List<GetReviewModel> reviews;
  const GetReviewsSuccessState(this.reviews);

  @override
  List<Object> get props => [reviews];
}

final class GetReviewsFailureState extends ChatState {
  final String error;
  const GetReviewsFailureState(this.error);

  @override
  List<Object> get props => [error];
}
