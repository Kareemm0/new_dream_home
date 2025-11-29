import 'package:equatable/equatable.dart';

import 'message.dart';

class ChatDetailsModel extends Equatable {
  final List<Message>? messages;

  const ChatDetailsModel({this.messages});

  factory ChatDetailsModel.fromJson(Map<String, dynamic> json) {
    return ChatDetailsModel(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'messages': messages?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [messages];
}
