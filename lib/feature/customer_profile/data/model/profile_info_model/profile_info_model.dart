import 'package:equatable/equatable.dart';

import 'user.dart';

class ProfileInfoModel extends Equatable {
  final User? user;

  const ProfileInfoModel({this.user});

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return ProfileInfoModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [user];
}
