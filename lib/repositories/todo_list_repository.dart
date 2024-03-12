import 'package:test_temp/modal/todo_response.dart';
import 'package:test_temp/service/api_provider.dart';

class ToDoListRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<ToDoResponse> getToDoList() async {
    return await apiProvider.getTodoList();
  }
}
