import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_temp/feature/data/repository/home_repository_impl.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepositoryImpl repositoryImpl = HomeRepositoryImpl();
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(onHomeInitialEvent);
  }



  FutureOr<void> onHomeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final response = await repositoryImpl.getProducts();
    if(response.isNotEmpty) {
     emit(HomeLoadedSuccessState(response));
   }else {
     emit(HomeLoadedErrorState("No Products Found"));
   }

  }
}
