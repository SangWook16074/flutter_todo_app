import 'package:flutter_todo_app/src/data/model/todo_model.dart';

import '../provider/todo_provider.dart';

class TodoRepository {
  static Stream<List<TodoModel>> todoProvider() => TodoApi.todoStream();

  static updateIsDone(String id) => TodoApi.updateTodoIsDone(id);
}
