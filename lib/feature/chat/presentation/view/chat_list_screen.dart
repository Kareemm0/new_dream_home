import 'package:dream_home/Core/utils/app_images.dart';
import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/styles/app_text_style.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/custom_loader.dart';
import '../../../auth/data/model/Login/login_model/login_model.dart';
import '../cubit/chat_cubit.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  LoginModel? _user;
  String? _userType;

  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    LoginModel? user = await getUserFromSharedPreferences();
    if (mounted) {
      setState(() {
        _user = user;
        _userType = user?.user?.role;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return const Center(child: CustomLoader());
    }
    return BlocProvider(
      create: (context) =>
          ChatCubit(getIt())..getAllChats(userid: _user!.user?.id ?? ""),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          final cubit = context.read<ChatCubit>();
          return Scaffold(
              appBar: appBar(context, title: "Chats".tr()),
              body: state is GetAllChatsLoadingState
                  ? CustomLoader()
                  : ListView.builder(
                      itemCount: cubit.chatModel?.chats?.length ?? 0,
                      itemBuilder: (context, index) {
                        final chat = cubit.chatModel?.chats?[index];
                        final isUser1 = chat?.user1?.id == _user?.user?.id;
                        final otherUser = isUser1
                            ? chat?.user2?.email?.split("@").firstOrNull ??
                                "Unknown"
                            : chat?.user1?.email?.split("@").firstOrNull ??
                                "Unknown";

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColor.yellowColor,
                              radius: 25,
                              backgroundImage: AssetImage(AppImages.craft2),
                            ),
                            title:
                                Text(otherUser, style: TextStyle(fontSize: 16)),
                            subtitle: Text(
                              chat?.messages?.isNotEmpty == true
                                  ? chat!.messages!.last.message ?? ""
                                  : "No messages yet",
                              style: TextStyle(fontSize: 12),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  DateFormat.Hm().format(
                                    DateTime.parse(
                                        chat?.updatedAt.toString() ?? ""),
                                  ),
                                  style: AppTextStyle.style16,
                                ),
                                SizedBox(height: 4),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: AppColor.green,
                                  child: Text(
                                    chat?.messages?.length.toString() ?? "0",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              context.push(Routes.chatDetails, extra: {
                                "senderId": _user?.user?.id.toString(),
                                "receiverId":
                                    isUser1 ? chat?.user2?.id : chat?.user1?.id,
                                "receiverName": otherUser,
                                "userType": _userType,
                              });
                            },
                          ),
                        );
                      },
                    ));
        },
      ),
    );
  }
}
