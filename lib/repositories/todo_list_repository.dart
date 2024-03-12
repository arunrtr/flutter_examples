import 'package:test_temp/service/api_provider.dart';

class ToDoListRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<dynamic> getToDoList() async {
    return await apiProvider.getTodoList();
  }
}
