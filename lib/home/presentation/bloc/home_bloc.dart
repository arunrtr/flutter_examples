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
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    print("Bloc: homeInitialEvent Called");
    emit.call(HomeLoadingState());
    final data = await repository.fetchProduct();
    emit.call(HomeLoadedSuccessState(data));
  }
}
