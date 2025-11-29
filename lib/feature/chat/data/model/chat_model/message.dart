import 'package:equatable/equatable.dart';

import 'receiver.dart';
import 'sender.dart';

class Message extends Equatable {
  final Sender? sender;
  final Receiver? receiver;
  final String? message;
  final DateTime? timestamp;
  final String? id;

  const Message({
    this.sender,
    this.receiver,
    this.message,
    this.timestamp,
    this.id,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        sender: json['sender'] == null
            ? null
            : Sender.fromJson(json['sender'] as Map<String, dynamic>),
        receiver: json['receiver'] == null
            ? null
            : Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
        message: json['message'] as String?,
        timestamp: json['timestamp'] == null
            ? null
            : DateTime.parse(json['timestamp'] as String),
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'sender': sender?.toJson(),
        'receiver': receiver?.toJson(),
        'message': message,
        'timestamp': timestamp?.toIso8601String(),
        '_id': id,
      };

  @override
  List<Object?> get props => [sender, receiver, message, timestamp, id];
}
