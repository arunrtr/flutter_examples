import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on <HomeProductCartClickedEvent>(homeProductCartClickedEvent);
    on<HomeProductFavouriteClickedEvent>(homeProductFavouriteClickedEvent);
    on<HomeNavigationWishlistClickedEvent>(homeNavigationWishlistClickedEvent);
    on<HomeNavigationCartClickedEvent>(homeNavigationCartClickedEvent);
    
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await  Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState());
  }
  FutureOr<void> homeNavigationWishlistClickedEvent(HomeNavigationWishlistClickedEvent event, Emitter<HomeState> emit) {
  }
 

  FutureOr<void> homeProductCartClickedEvent(HomeProductCartClickedEvent event, Emitter<HomeState> emit) {
  }

  FutureOr<void> homeProductFavouriteClickedEvent(HomeProductFavouriteClickedEvent event, Emitter<HomeState> emit) {
  }

  FutureOr<void> homeNavigationCartClickedEvent(HomeNavigationCartClickedEvent event, Emitter<HomeState> emit) {
  }
}
