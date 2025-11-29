import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class OrderModel with EquatableMixin {
  final String? orderid;
  final String? userName;
  final String? userphone;
  final String? userLocation;
  final String? userId;
  final String? orderStatus;
  final String? job;

  OrderModel({
    this.orderid,
    this.userName,
    this.userphone,
    this.userLocation,
    this.userId,
    this.orderStatus,
    this.job,
  });

  factory OrderModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return OrderModel(
      orderid: doc.id,
      userId: doc.data()!['user_id'],
      userLocation: doc.data()!['user_location'],
      userName: doc.data()!['user_name'],
      userphone: doc.data()!['user_phone'],
      orderStatus: doc.data()!['order_status'],
      job: doc.data()!['job'],
    );
  }
  @override
  List<Object?> get props => [
        orderid,
        userId,
        userName,
        userphone,
        userLocation,
        orderStatus,
        job,
      ];
}
