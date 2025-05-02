import 'dart:convert';

import 'package:flutter_todo_app/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos";
  final String addurl = "https://dummyjson.com/todos/add";

  Future<List<ToDo>> getUncompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<ToDo> todos = List.empty(growable: true);

    for (var element in resp) {
      ToDo task = ToDo.fromJson(element);
      if (!task.completed!) {
        todos.add(task);
      }
    }
    return todos;
  }

  Future<List<ToDo>> getCompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<ToDo> todos = List.empty(growable: true);

    for (var element in resp) {
      ToDo task = ToDo.fromJson(element);
      if (task.completed!) {
        todos.add(task);
      }
    }
    return todos;
  }

  Future<String> addToDo(ToDo newTodo) async {
    //Dummy Todo API içerisinden nasıl ekleneceğine dair bilgiler aldık
    final response = await http.post(Uri.parse(addurl),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: json.encode(newTodo.toJson()));
    print(response.body);
    return response.body;
  }

  Future<String> updateToDo(bool completed, String itemId) async {
    //Dummy Todo API içerisinden nasıl ekleneceğine dair bilgiler aldık
    String updateUrl = '$url/$itemId';
    final response1 = await http.patch(Uri.parse(updateUrl),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: json.encode({
          "completed": completed,
        }));
    print(response1.body);
    return response1.body;
  }

  Future<String> deleteToDo(String itemId) async {
    //Dummy Todo API içerisinden nasıl ekleneceğine dair bilgiler aldık
    String deleteUrl = '$url/$itemId';
    final response1 = await http.delete(Uri.parse(deleteUrl));
    print(response1.body);
    return response1.body;
  }
}
