import 'package:chat_app_with_ai/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/send_message_cubit/send_message_cubit.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({super.key, required this.message, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF4169E1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.smart_toy_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUser
                    ? const Color(0xFF4169E1)
                    : const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isUser ? 20 : 8),
                  topRight: Radius.circular(isUser ? 8 : 20),
                  bottomLeft: const Radius.circular(20),
                  bottomRight: const Radius.circular(20),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isUser ? Colors.white : const Color(0xFF2C2C2C),
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class LoadingChatBubble extends StatefulWidget {
  const LoadingChatBubble({super.key});

  @override
  State<LoadingChatBubble> createState() => _LoadingChatBubbleState();
}

class _LoadingChatBubbleState extends State<LoadingChatBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF4169E1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.smart_toy_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(3, (index) {
                      final delay = index * 0.2;
                      final value = (_controller.value - delay) % 1.0;
                      final opacity = value < 0.5
                          ? (value * 2).clamp(0.3, 1.0)
                          : ((1.0 - value) * 2).clamp(0.3, 1.0);

                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 4),
                        child: Opacity(
                          opacity: opacity,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2C2C2C),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FailureChatBubble extends StatelessWidget {
  final List<MessageModel> messages;
  final VoidCallback? onResend;
  final String message;

  const FailureChatBubble({
    super.key,
    required this.messages,
    this.onResend,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5F5),
                border: Border.all(color: const Color(0xFFFFE0E0), width: 1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Color(0xFFDC3545),
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: Color(0xFFDC3545),
                            fontSize: 15,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (onResend != null) ...[
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        messages.removeLast();
                        messages.add(
                          MessageModel(
                            role: 'user',
                            parts: [MessagePart(text: message)],
                          ),
                        );
                        context.read<SendMessageCubit>().sendMessage(messages);
                      },
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDC3545),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.refresh, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Resend',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
