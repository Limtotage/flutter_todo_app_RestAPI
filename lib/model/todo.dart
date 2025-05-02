class ToDo {
  ToDo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  ToDo.fromJson(Map<String, dynamic> jsonmap) {
    id = jsonmap["id"];
    todo = jsonmap["todo"];
    completed = jsonmap["completed"];
    userId = jsonmap["userId"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["todo"] = todo;
    data["completed"] = completed;
    data["userId"] = userId;
    return data;
  }
}
