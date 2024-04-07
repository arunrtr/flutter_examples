import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_temp/feature/data/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository  repository = HomeRepository();

  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(onHomeInitialEvent);
  }

  FutureOr<void> onHomeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
   List<dynamic> result = await repository.fetchProducts();
   emit(HomeLoadedSuccessState(result));

  }
}
