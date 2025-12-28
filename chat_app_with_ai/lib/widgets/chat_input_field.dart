import 'package:chat_app_with_ai/cubits/send_message_cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/message_model.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key, required this.messages});
  final List<MessageModel> messages;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Write your message',
                          hintStyle: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        maxLines: null,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (value) => {sendMessage(value)},
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.mic_none,
                        color: Color(0xFF9E9E9E),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFF4169E1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: () {
                  sendMessage(_messageController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) {
    if (context.read<SendMessageCubit>().state is SendMessageFailure) {
      widget.messages.removeLast();
    }
    widget.messages.add(
      MessageModel(
        parts: [MessagePart(text: text)],
        role: 'user',
      ),
    );
    context.read<SendMessageCubit>().sendMessage(widget.messages);
    _messageController.clear();
    _focusNode.unfocus();
  }
}
