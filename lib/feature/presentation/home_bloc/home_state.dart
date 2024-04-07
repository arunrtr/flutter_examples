part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends  HomeState{}

class HomeLoadedSuccessState extends HomeState{
  List<dynamic> products;
  HomeLoadedSuccessState(this.products);
}

class HomeLoadedErrorState extends HomeState{}