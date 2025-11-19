import 'package:flutter/material.dart';
import 'package:task_mangemnt_app/models/task_manger.dart';

import '../models/task_model.dart';

class TaskCardWidget extends StatefulWidget {
  final TaskModel task;
  final TaskManger taskManger;
  final VoidCallback onDelete;
  const TaskCardWidget({
    super.key,
    required this.task,
    required this.taskManger,
    required this.onDelete,
  });
  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  String _formatDate(DateTime date) {
    return 'Created: ${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Checkbox(
              value: widget.task.isCompleted,
              onChanged: (value) {
                widget.taskManger.updateTask(widget.task, value ?? false);
                setState(() {});
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatDate(widget.task.date),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                widget.taskManger.removeTask(widget.task);
                widget.onDelete();
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
