import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_temp/home/data/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository = HomeRepository();

  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeSearchClickedEvent>(homeSearchClickedEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    print("Bloc: homeInitialEvent Called");
    emit.call(HomeLoadingState());
    final data = await repository.fetchProduct();
    emit.call(HomeLoadedSuccessState(data));
  }

  FutureOr<void> homeSearchClickedEvent(HomeSearchClickedEvent event, Emitter<HomeState> emit) {
    emit.call(HomeSearchLoading());
    final data = event.products.where((element) {
      String title = element["description"];
      if (title.toLowerCase().contains(event.searchText)) {
        return true;
      }
      return false;
    }).toList();
    emit.call(HomeSearchResultLoaded(data));
  }
}
