import 'package:test_temp/service/api_provider.dart';

import '../modal/todo_response.dart';

class ToDoListRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<ToDoResponse> getToDoList() async {
    return await apiProvider.getTodoList();
  }
}
