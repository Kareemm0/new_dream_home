import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_home/core/constant/constant.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
part 'pick_location_state.dart';

class PickLocationCubit extends Cubit<PickLocationState> {
  PickLocationCubit() : super(PickLocationInitial());

  String? locationToString;

  final auth = FirebaseAuth.instance.currentUser;

  Future<void> getUserLocation() async {
    try {
      if (auth == null) {
        tempId;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      Position position = await Geolocator.getCurrentPosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks.first;
      String locationString =
          "${place.street}, ${place.locality}, ${place.country}";

      locationToString = locationString;
      log(locationString);
      emit(ChangeLocationToHumanStringSuccessState());

      String id = auth?.uid ?? tempId;

      await FirebaseFirestore.instance.collection('users').doc(id).set({
        'location': locationString,
        'latitude': position.latitude,
        'longitude': position.longitude,
      }, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      //final message = getFriendlyErrorMessage(e.code);
      log(e.toString());
      showToast(message: e.toString(), backgroundColor: AppColor.redED);
    }
  }
}
