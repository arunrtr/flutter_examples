part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitialEvent extends HomeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class HomeProductFavouriteClickedEvent extends HomeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeProductCartClickedEvent extends HomeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class HomeNavigationCartClickedEvent extends HomeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class HomeNavigationWishlistClickedEvent extends HomeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

