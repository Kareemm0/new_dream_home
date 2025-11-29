part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<WorkerDataModel> workersList;

  SearchSuccessState(this.workersList);
}
