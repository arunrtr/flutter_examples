part of 'home_bloc.dart';

// there are two types of state - responsible for UI and Responsible for Action
abstract class HomeState extends Equatable {
  const HomeState();
}

abstract class HomeActionState extends HomeState {
  const HomeActionState();
}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedSuccessState extends HomeState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeErrorState extends HomeState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeProductWishlistActionState extends HomeActionState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeProductCartActionState extends HomeActionState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class HomeNavigateToWishlistActionState extends HomeActionState {
@override
List<Object?> get props => throw UnimplementedError();
}

class HomeNavigateToCartActionState extends HomeActionState {
  @override
  List<Object?> get props => throw UnimplementedError();
}