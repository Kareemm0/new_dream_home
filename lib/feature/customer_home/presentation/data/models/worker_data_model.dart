import 'package:dream_home/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';

class WorkerDataModel {
  final String jobName;
  final String image;
  final String jobNameEn;
  final String vector;

  WorkerDataModel({
    required this.jobName,
    required this.image,
    required this.jobNameEn,
    required this.vector,
  });
}

final List<WorkerDataModel> worker = [
  WorkerDataModel(
    jobName: "Carpentry".tr(),
    image: AppImages.carpentry,
    jobNameEn: "Carpentry",
    vector: AppImages.carpenter,
  ),
  WorkerDataModel(
    jobName: "Blacksmithing".tr(),
    image: AppImages.blacksmith,
    jobNameEn: "Blacksmithing",
    vector: AppImages.blacksmith,
  ),
  WorkerDataModel(
    jobName: "Plumbing".tr(),
    image: AppImages.bgPlumbing,
    jobNameEn: "Plumbing",
    vector: AppImages.plumber,
  ),
  WorkerDataModel(
    jobName: "Electricity".tr(),
    image: AppImages.electricity,
    jobNameEn: "Electricity",
    vector: AppImages.electrician,
  ),
  WorkerDataModel(
    jobName: "Painting".tr(),
    image: AppImages.painting,
    jobNameEn: "Painting",
    vector: AppImages.painter,
  ),
  WorkerDataModel(
    jobName: "Tiling".tr(),
    image: AppImages.tiler,
    jobNameEn: "Tiling",
    vector: AppImages.tiler,
  ),
  WorkerDataModel(
    jobName: "Carving".tr(),
    image: AppImages.sculptor,
    jobNameEn: "Carving and Sculpting",
    vector: AppImages.sculptor,
  ),
  WorkerDataModel(
    jobName: "Flooring".tr(),
    image: AppImages.woodenFlooring,
    jobNameEn: "Tiling and Flooring Installation",
    vector: AppImages.flooring,
  ),
  WorkerDataModel(
    jobName: "Cooling".tr(),
    image: AppImages.airConditioner,
    jobNameEn: "Cooling and Air Conditioning",
    vector: AppImages.technician,
  ),
  WorkerDataModel(
    jobName: "Electronic".tr(),
    image: AppImages.appliance,
    jobNameEn: "Electronic Repairs",
    vector: AppImages.electronic,
  ),
  WorkerDataModel(
    jobName: "Appliance".tr(),
    image: AppImages.home,
    jobNameEn: "Home Appliance Maintenance",
    vector: AppImages.home,
  ),
  WorkerDataModel(
    jobName: "House".tr(),
    image: AppImages.clean,
    jobNameEn: "House Cleaning",
    vector: AppImages.clean,
  ),
];
