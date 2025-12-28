import 'package:chat_app_with_ai/cubits/send_message_cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/message_model.dart';
import '../widgets/chat_input_field.dart';
import '../widgets/chat_list_view.dart';
import '../widgets/start_conversation_widget.dart';

class ChatPage extends StatefulWidget {
  final VoidCallback? onSendMessage;

  const ChatPage({super.key, this.onSendMessage});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageModel> messages = [];

  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendMessageCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF4169E1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.smart_toy_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ChatGPT',
                    style: TextStyle(
                      color: Color(0xFF4169E1),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Color(0xFF00C853), size: 8),
                      SizedBox(width: 4),
                      Text(
                        'Online',
                        style: TextStyle(
                          color: Color(0xFF00C853),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.volume_up_outlined, color: Colors.black54),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black54),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<SendMessageCubit, SendMessageState>(
                listener: (context, state) {
                  if (state is SendMessageSuccess) {
                    messages.add(state.messageModel);
                    Future.delayed(const Duration(milliseconds: 100), () {
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    });
                  }
                  if (state is SendMessageFailure) {
                    // show snackbar
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errMesasge)));
                    // Future.delayed(const Duration(milliseconds: 200), () {
                    //   messages.removeLast();
                    // });
                  }
                },
                builder: (context, state) {
                  if (state is SendMessageLoading) {
                    return LoadingChatListView(
                      scrollController: scrollController,
                      messages: messages,
                    );
                  } else if (state is SendMessageSuccess) {
                    return ChatListView(
                      scrollController: scrollController,
                      messages: messages,
                    );
                  } else if (state is SendMessageFailure) {
                    return FailureChatListView(
                      scrollController: scrollController,
                      messages: messages,
                      onResend: () {
                        context.read<SendMessageCubit>().sendMessage(messages);
                      },
                    );
                  } else {
                    return StartConversationWidget();
                  }
                },
              ),
            ),
            ChatInputField(messages: messages),
          ],
        ),
      ),
    );
  }
}
