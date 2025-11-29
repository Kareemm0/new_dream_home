part of 'pick_location_cubit.dart';

sealed class PickLocationState {}

final class PickLocationInitial extends PickLocationState {}

final class ChangeLocationToHumanStringSuccessState extends PickLocationState {}
