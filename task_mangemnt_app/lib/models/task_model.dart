import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final DateTime date;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.date,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [title];
}
