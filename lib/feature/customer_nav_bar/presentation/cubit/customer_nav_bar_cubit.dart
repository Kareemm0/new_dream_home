import 'package:dream_home/feature/customer_home/presentation/view/customer_home_screen.dart';
import 'package:dream_home/feature/customer_nav_bar/presentation/cubit/customer_nav_bar_state.dart';
import 'package:dream_home/feature/customer_profile/presentation/views/customer_profil_screen.dart';
import 'package:dream_home/feature/search/presentation/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../chat/presentation/view/chat_list_screen.dart';

class CustomerNavBarCubit extends Cubit<CustomerNavBarState> {
  CustomerNavBarCubit() : super(CustomerNavBarInitialState());

  static CustomerNavBarCubit get(context) =>
      BlocProvider.of<CustomerNavBarCubit>(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }

  List<Widget> screens = [
    CustomerHomeScreen(),
    SearchScreen(),
    ChatListScreen(),
    CustomerProfilScreen(),
  ];
}
