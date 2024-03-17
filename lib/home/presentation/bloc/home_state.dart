part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeActionState extends HomeState{} // it can be used based on the requirement

//laoding,loaded
class HomeInitialState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeLoadedSuccessState extends HomeState{
 final List<dynamic> products;
  HomeLoadedSuccessState(this.products);
}

//search
class HomeSearchLoading extends HomeState{}
class HomeSearchResultLoaded extends HomeState{
 final List<dynamic> products;
 HomeSearchResultLoaded(this.products);
}
//error
class HomeErrorState extends HomeState{

}