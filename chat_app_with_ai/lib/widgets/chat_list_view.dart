import 'package:flutter/material.dart';

import '../models/message_model.dart';
import 'chat_bubble.dart';

class LoadingChatListView extends StatelessWidget {
  const LoadingChatListView({
    super.key,
    required this.scrollController,
    required this.messages,
  });

  final ScrollController scrollController;
  final List<MessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: messages.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const LoadingChatBubble();
        }
        var newIndex = messages.length - (index + 0);
        final message = messages[newIndex];
        return ChatBubble(
          message: message.text,
          isUser: message.role == 'user',
        );
      },
    );
  }
}

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
    required this.scrollController,
    required this.messages,
  });
  final ScrollController scrollController;
  final List<MessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        var newIndex = messages.length - (index + 1);
        final message = messages[newIndex];
        return ChatBubble(
          message: message.text,
          isUser: message.role == 'user',
        );
      },
    );
  }
}

class FailureChatListView extends StatelessWidget {
  const FailureChatListView({
    super.key,
    required this.scrollController,
    required this.messages,
    this.onResend,
  });
  final ScrollController scrollController;
  final List<MessageModel> messages;
  final VoidCallback? onResend;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        var newIndex = messages.length - (index + 1);
        if (index == 0) {
          return FailureChatBubble(
            message: messages[newIndex].text,
            messages: messages,
            onResend: onResend,
          );
        }

        final message = messages[newIndex];
        return ChatBubble(
          message: message.text,
          isUser: message.role == 'user',
        );
      },
    );
  }
}
