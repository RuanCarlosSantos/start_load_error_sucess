import 'package:dio/dio.dart';
import '../models/todo_model.dart';

class TodoRepository {
  Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository({Dio client}) {
    if (client == null) {
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
