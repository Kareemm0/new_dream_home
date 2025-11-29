import 'package:dream_home/feature/orders/presentation/views/order_screen.dart';
import 'package:dream_home/feature/worker_home/presentation/views/worker_home_screen.dart';
import 'package:dream_home/feature/worker_nav_bar/presentation/cubit/worker_nav_bar_state.dart';
import 'package:dream_home/feature/worker_profile/presentation/views/worker_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../chat/presentation/view/chat_list_screen.dart';

class WorkerNavBarCubit extends Cubit<WorkerNavBarState> {
  WorkerNavBarCubit() : super(WorkerNavBarInitialState());

  static WorkerNavBarCubit get(context) =>
      BlocProvider.of<WorkerNavBarCubit>(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }

  List<Widget> screens = [
    WorkerHomeScreen(),
    OrderScreen(),
    ChatListScreen(),
    WorkerProfileScreen(),
  ];
}
