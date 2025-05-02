import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/task_type.dart';

class GestureIconsItem extends StatefulWidget {
  const GestureIconsItem(
      {super.key,
      required this.path,
      required this.taskType,
      required this.onIconSelected});
  final Function(TaskType) onIconSelected;
  final String path;
  final TaskType taskType;
  @override
  State<GestureIconsItem> createState() => _GestureIconsItemState();
}

class _GestureIconsItemState extends State<GestureIconsItem> {
  TaskType retype(TaskType res) {
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 300),
            content: Text("Task Selected.")));
        widget.onIconSelected(widget.taskType);
      },
      child: Image.asset(widget.path),
    );
  }
}
