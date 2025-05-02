import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/color.dart';
import 'package:flutter_todo_app/constants/task_type.dart';
import 'package:flutter_todo_app/customItems/custom_button.dart';
import 'package:flutter_todo_app/customItems/header_item.dart';
import 'package:flutter_todo_app/customItems/todo_item.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/screens/add_new_task.dart';
import 'package:flutter_todo_app/services/todo_service.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
    Task(
        type: TaskType.note,
        title: "Study Lesson",
        description: "Study Comp177",
        isCompleted: false),
    Task(
        type: TaskType.goal,
        title: "Run 5 Km",
        description: "Just Do It!",
        isCompleted: false),
    Task(
        type: TaskType.calendar,
        title: "Go to Party",
        description: "Attend to party",
        isCompleted: false),
  ];
  List<Task> todoCompleted = [
    Task(
        type: TaskType.goal,
        title: "Run 5 Km",
        description: "Just Do It!",
        isCompleted: false),
    Task(
        type: TaskType.calendar,
        title: "Go to Party",
        description: "Attend to party",
        isCompleted: false),
  ];
  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    TodoService jsonservice = TodoService();
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backGroundColor),
          body: Column(
            children: [
              //Header
              Headeritem(),
              //Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                          future: jsonservice.getUncompletedTodos(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return CircularProgressIndicator();
                            } else {
                              return ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Todoitem(
                                    task: snapshot.data![index],
                                    itemId: snapshot.data![index].id!,
                                    completed: false,
                                  );
                                },
                              );
                            }
                          })),
                ),
              ),
              //Completed Text
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: const Text("Completed",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                ),
              ),
              //Bottom Column

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                          future: jsonservice.getCompletedTodos(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return CircularProgressIndicator();
                            } else {
                              return ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Todoitem(
                                    task: snapshot.data![index],
                                    itemId: snapshot.data![index].id!,
                                    completed: true,
                                  );
                                },
                              );
                            }
                          })),
                ),
              ),
              //New task button
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomButtonItem(
                    width: deviceWidth - 40,
                    height: 40,
                    text: "Add New Todo",
                    color: Color(0xFF327E3B),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddNewTaskScreen(
                          addNewTask: (newTask) => addNewTask(newTask),
                        ),
                      ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
