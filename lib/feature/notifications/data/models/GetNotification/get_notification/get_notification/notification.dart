import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String? id;
  final String? userId;
  final String? message;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Notification({
    this.id,
    this.userId,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json['_id'] as String?,
        userId: json['userId'] as String?,
        message: json['message'] as String?,
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
        'userId': userId,
        'message': message,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      message,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
