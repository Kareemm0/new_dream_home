import 'dart:developer';

import 'package:dream_home/core/extension/extension.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/styles/app_text_style.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/dialogs/logout_dialog.dart';
import '../cubit/chat_cubit.dart';
import '../widgets/custom_rating_dialog.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String senderId;
  final String receiverId;
  final String receiverName;
  final String userType;

  const ChatDetailsScreen({
    super.key,
    required this.senderId,
    required this.receiverId,
    required this.receiverName,
    required this.userType,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  bool hasRatingRequestBeenSent = false;
  bool hasSentRatingRequest = false;

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String? _reviewId;
  String? _reviewStatus;

  Future<void> load() async {
    String? reviewId = await getReviewId();
    String? reviewStatus = await getReviewStaus();
    setState(() {
      _reviewId = reviewId;
      _reviewStatus = reviewStatus;
    });

    log("=================== REVIEW ID $_reviewId");
    log("=================== REVIEW STATUS $_reviewStatus");
  }

  Future<void> checkRatingRequestStatusSent() async {
    final hasSent = hasSentRatingRequest;
    if (mounted) {
      setState(() {
        hasSentRatingRequest = hasSent;
      });
    }
  }

  Future<void> checkRatingRequestStatus() async {
    bool hasSentRequest = hasRatingRequestBeenSent;

    if (mounted) {
      setState(() {
        hasRatingRequestBeenSent = hasSentRequest;
      });
    }
  }

  @override
  void initState() {
    checkRatingRequestStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(getIt())
        ..getReview(employeeId: widget.senderId)
        ..getChatMessages(
            senderId: widget.senderId, receiverId: widget.receiverId),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is SendMessageSuccessState) {
            _messageController.clear();
            _scrollToBottom();
          }
          if (state is GetAllChatMessagesSuccessState) {
            _scrollToBottom();
          }
          if (state is UpdateReviewSuccessState) {
            checkRatingRequestStatusSent();
          }
        },
        builder: (context, state) {
          final cubit = context.read<ChatCubit>();
          final messages = cubit.chatDetailsModel?.messages ?? [];

          return Scaffold(
            appBar: appBar(
              context,
              automaticallyImplyLeading: false,
              isCenter: false,
              title: widget.receiverName,
              leading: Icon(Icons.arrow_back_ios, color: AppColor.yellowColor)
                  .onTap(context.pop),
              actions: [
                if (widget.userType != 'employee' && !hasSentRatingRequest)
                  IconButton(
                      icon: Icon(Icons.star),
                      onPressed: () {
                        logoutDialog(
                          widget: CustomRatingDialog(),
                          context,
                        );
                      },
                      color: AppColor.yellowColor),
                if (widget.userType != 'employee')
                  IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {},
                    color: AppColor.yellowColor,
                  ),
                if (widget.userType == 'employee' && !hasRatingRequestBeenSent)
                  IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () async {
                      cubit.sendMessage(
                        senderId: widget.senderId,
                        receiverId: widget.receiverId,
                        message: 'rateUs'.tr(),
                      );
                      await markRatingRequestAsSent();
                      await markRatingRequestSent(widget.receiverId);

                      if (mounted) {
                        setState(() {
                          hasRatingRequestBeenSent = true;
                          hasSentRatingRequest = true;
                        });
                      }
                      cubit.requestReview(
                        employeeId: widget.senderId,
                        customerId: widget.receiverId,
                      );
                    },
                    color: AppColor.yellowColor,
                  ),
                if (widget.userType != 'employee')
                  IconButton(
                    icon: Icon(Icons.videocam),
                    onPressed: () {},
                    color: AppColor.yellowColor,
                  ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isMe =
                          message.sender?.id.toString() == widget.senderId;

                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                isMe ? AppColor.yellowColor : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.message ?? "",
                                style: AppTextStyle.style16.copyWith(
                                  color: isMe ? AppColor.white : AppColor.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                DateFormat('hh:mm a').format(
                                    message.timestamp ?? DateTime.now()),
                                style: AppTextStyle.style14.copyWith(
                                  color: isMe ? AppColor.white : AppColor.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.attach_file),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: "Typeamessage".tr(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          if (_messageController.text.trim().isNotEmpty) {
                            cubit.sendMessage(
                              senderId: widget.senderId,
                              receiverId: widget.receiverId,
                              message: _messageController.text.trim(),
                            );
                          }
                        },
                        color: AppColor.yellowColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
