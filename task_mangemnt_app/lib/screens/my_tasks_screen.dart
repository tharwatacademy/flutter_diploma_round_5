import 'package:flutter/material.dart';
import 'package:task_mangemnt_app/models/task_manger.dart';

import '../widgets/bottom_input_bar_widget.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/task_card_widget.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({super.key});

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  TaskManger taskManger = TaskManger();
  void onChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeaderWidget(title: 'My Tasks'),

            Expanded(
              child: taskManger.tasks.isEmpty
                  ? const EmptyStateWidget()
                  : TasksList(
                      taskManger: taskManger,
                      onAllTasksDeleted: onChanged,
                    ),
            ),

            BottomInputBarWidget(taskManger: taskManger, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}

class TasksList extends StatefulWidget {
  final TaskManger taskManger;
  final VoidCallback onAllTasksDeleted;
  const TasksList({
    super.key,
    required this.taskManger,
    required this.onAllTasksDeleted,
  });

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.taskManger.tasks.length,
      itemBuilder: (context, index) {
        return TaskCardWidget(
          onDelete: () {
            if (widget.taskManger.tasks.isEmpty) {
              widget.onAllTasksDeleted();
            } else {
              setState(() {});
            }
          },
          task: widget.taskManger.tasks[index],
          taskManger: widget.taskManger,
        );
      },
    );
  }
}
