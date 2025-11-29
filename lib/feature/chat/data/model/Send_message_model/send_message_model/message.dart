import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String? sender;
  final String? receiver;
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
        sender: json['sender'] as String?,
        receiver: json['receiver'] as String?,
        message: json['message'] as String?,
        timestamp: json['timestamp'] == null
            ? null
            : DateTime.parse(json['timestamp'] as String),
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'receiver': receiver,
        'message': message,
        'timestamp': timestamp?.toIso8601String(),
        '_id': id,
      };

  @override
  List<Object?> get props => [sender, receiver, message, timestamp, id];
}
