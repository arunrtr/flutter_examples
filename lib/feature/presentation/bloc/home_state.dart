part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState{
  final List<dynamic> products;
  HomeLoadedSuccessState(this.products);
}

class HomeLoadedErrorState extends HomeState{
  final String message;
  HomeLoadedErrorState(this.message);
}