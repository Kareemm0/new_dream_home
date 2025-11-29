import 'package:equatable/equatable.dart';

import 'message.dart';

class Chat extends Equatable {
  final String? id;
  final List<Message>? messages;
  final String? user1;
  final String? user2;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Chat({
    this.id,
    this.messages,
    this.user1,
    this.user2,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json['_id'] as String?,
        messages: (json['messages'] as List<dynamic>?)
            ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
            .toList(),
        user1: json['user1'] as String?,
        user2: json['user2'] as String?,
        status: json['status'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'messages': messages?.map((e) => e.toJson()).toList(),
        'user1': user1,
        'user2': user2,
        'status': status,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      messages,
      user1,
      user2,
      status,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
