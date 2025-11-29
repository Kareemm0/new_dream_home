import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String? userId;
  final String? message;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Notification({
    this.userId,
    this.message,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        userId: json['userId'] as String?,
        message: json['message'] as String?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'message': message,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      userId,
      message,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
