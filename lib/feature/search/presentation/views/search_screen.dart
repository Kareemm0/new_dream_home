import 'dart:developer';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:dream_home/core/utils/fade_animation_custom.dart';
import 'package:dream_home/feature/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/app_sized.dart';
import '../../../../core/widget/aimated_loader.dart';
import '../../../customer_home/presentation/widgets/custom_grid_view_item_builder.dart';
import '../widget/custom_search_text_form_filed.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          final cubit = context.read<SearchCubit>();
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: Column(
              children: [
                FadeAnimationCustom(
                  delay: 1.2,
                  child: CustomSearchTextFormFiled(
                    controller: cubit.searchController,
                    onChanged: (query) {
                      log(cubit.searchController.text);
                      log("Query $query");
                      cubit.searchWorkshops(query);
                    },
                  ),
                ),
                cubit.filteredWorkshops.isEmpty
                    ? height(heightSize(context) * 0.3)
                    : height(16),
                cubit.filteredWorkshops.isEmpty
                    ? Expanded(
                        child: AnimatedLoader(
                          animation: AppImages.emptyList,
                        ),
                      )
                    : Expanded(
                        child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          padding: EdgeInsets.only(bottom: 8, top: 4),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) {
                            return CustomGridViewItemBuilder(
                              jobName: cubit.filteredWorkshops[index].jobName,
                              vectors: cubit.filteredWorkshops[index].image,
                            );
                          },
                          itemCount: cubit.filteredWorkshops.length,
                        ),
                      ))
              ],
            ),
          ));
        },
      ),
    );
  }
}
