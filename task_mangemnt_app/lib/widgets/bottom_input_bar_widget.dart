import 'package:flutter/material.dart';
import 'package:task_mangemnt_app/models/task_manger.dart';
import 'package:task_mangemnt_app/models/task_model.dart';
import 'package:task_mangemnt_app/styles/app_text_styles.dart';

class BottomInputBarWidget extends StatefulWidget {
  const BottomInputBarWidget({
    super.key,
    required this.taskManger,
    required this.onChanged,
  });
  final TaskManger taskManger;
  final VoidCallback onChanged;
  @override
  State<BottomInputBarWidget> createState() => _BottomInputBarWidgetState();
}

class _BottomInputBarWidgetState extends State<BottomInputBarWidget> {
  String taskTitle = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE0E0E0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFieldWidget(
              onChanged: (value) {
                taskTitle = value;
              },
              hintText: 'Add a new task...',
            ),
          ),
          Text('data', style: AppTextStyles.h3()),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  TaskModel task = TaskModel(
                    title: taskTitle,
                    date: DateTime.now(),
                    isCompleted: false,
                  );
                  widget.taskManger.addTask(task);
                  widget.onChanged();
                },
                borderRadius: BorderRadius.circular(24),
                child: const Center(
                  child: Icon(Icons.add, color: Colors.black, size: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? hintColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;

  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.fillColor = Colors.white,
    this.hintColor = const Color(0xFF4A4A4A),
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          borderSide: BorderSide.none,
        ),
        contentPadding: contentPadding,
      ),
    );
  }
}
