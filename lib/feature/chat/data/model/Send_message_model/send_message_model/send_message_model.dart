import 'package:equatable/equatable.dart';

import 'chat.dart';

class SendMessageModel extends Equatable {
  final String? message;
  final Chat? chat;

  const SendMessageModel({this.message, this.chat});

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
      message: json['message'] as String?,
      chat: json['chat'] == null
          ? null
          : Chat.fromJson(json['chat'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'chat': chat?.toJson(),
      };

  @override
  List<Object?> get props => [message, chat];
}
