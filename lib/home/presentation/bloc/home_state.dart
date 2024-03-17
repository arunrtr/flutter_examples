part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeActionState extends HomeState{} // it can be used based on the requirement

class HomeInitialState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeLoadedSuccessState extends HomeState{

 final List<dynamic> products;
  HomeLoadedSuccessState(this.products);
}
class HomeErrorState extends HomeState{

}