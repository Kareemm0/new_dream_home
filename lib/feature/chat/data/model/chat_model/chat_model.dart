import 'package:equatable/equatable.dart';

import 'chat.dart';

class ChatModel extends Equatable {
  final List<Chat>? chats;

  const ChatModel({this.chats});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        chats: (json['chats'] as List<dynamic>?)
            ?.map((e) => Chat.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'chats': chats?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [chats];
}
