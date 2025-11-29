import 'package:dotted_border/dotted_border.dart';
import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/feature/auth/presentation/cubit/register/register_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widget/dialogs/custom_images_picker_dialog.dart';

class CustomAddImage extends StatelessWidget {
  const CustomAddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Row(
          children: [
            DottedBorder(
              strokeWidth: 2,
              color: AppColor.primaryColor,
              borderType: BorderType.Circle,
              dashPattern: const [8, 4],
              child: SizedBox(
                width: 100,
                height: 100,
                child: cubit.profileImage == null
                    ? const CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profilePic),
                      )
                    : CircleAvatar(
                        backgroundColor: AppColor.white,
                        backgroundImage: FileImage(cubit.profileImage!),
                      ),
              ),
            ),
            width(12),
            Text(
              "addImage".tr(),
              style: AppTextStyle.style16.copyWith(
                color: AppColor.primaryColor,
              ),
            ).onTap(() {
              showImagePickerDialog(
                context,
                cameraOnTap: () {
                  cubit.logoPicker(ImageSource.camera);
                  context.pop();
                },
                galleryOnTap: () {
                  cubit.logoPicker(ImageSource.gallery);
                  context.pop();
                },
                cameraText: "camera".tr(),
                galleryText: "gallery".tr(),
              );
            }),
          ],
        );
      },
    );
  }
}
