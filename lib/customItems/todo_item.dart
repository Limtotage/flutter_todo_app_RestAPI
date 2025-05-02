import 'package:flutter/material.dart';
//import 'package:flutter_todo_app/constants/task_type.dart'; Fork edildi
//import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/services/todo_service.dart';

class Todoitem extends StatefulWidget {
  const Todoitem(
      {super.key,
      required this.task,
      required this.itemId,
      required this.completed});
  final ToDo task;
  final int itemId;
  final bool completed;
  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  TodoService todoService = TodoService();
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.completed; // dışarıdan gelen değerle başla
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.itemId.toString()),
      direction: DismissDirection.horizontal,
      child: Card(
        color: isChecked ? Colors.grey : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /* Fork Edildi Firebase işlemlerinde kullan şuan dummy APı ve Rest APı kullanıyoruz
              widget.task.type == TaskType.note
                  ? Image.asset("lib/assets/images/Task.png")
                  : widget.task.type == TaskType.calendar
                      ? Image.asset("lib/assets/images/Calendar.png")
                      : Image.asset("lib/assets/images/Goal.png"),*/
              Image.asset("lib/assets/images/Task.png"),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.task.todo!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          decoration: isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    Text(
                      "User ID: ${widget.task.userId!}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 81, 81, 81),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          decoration: isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                ),
              ),
              Checkbox(
                  value: isChecked,
                  onChanged: (val) => {
                        setState(() {
                          isChecked = val!;
                          widget.task.completed = isChecked;
                        }),
                        todoService.updateToDo(
                            isChecked, widget.itemId.toString())
                      })
            ],
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (!isChecked) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 300),
              content: Text("The task hasn't been completed."),
            ),
          );
          return false; // silmeye izin verme
        }
        return true; // silmeye izin ver
      },
      onDismissed: (direction) {
        todoService.deleteToDo(widget.itemId.toString());
      },
    );
  }
}
