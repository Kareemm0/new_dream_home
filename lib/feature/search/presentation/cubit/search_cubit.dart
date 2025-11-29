import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../customer_home/presentation/data/models/worker_data_model.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<WorkerDataModel> filteredWorkshops = [];

  final TextEditingController searchController = TextEditingController();

  void searchWorkshops(String query) {
    if (query.isEmpty) {
      filteredWorkshops = [];
    } else {
      filteredWorkshops = worker.where((job) {
        final jobName = job.jobName.toLowerCase();

        final queryLower = query.toLowerCase();
        return jobName.contains(queryLower);
      }).toList();
    }

    emit(SearchSuccessState(filteredWorkshops));
  }
}
