part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeSearchClickedEvent extends HomeEvent {
  final List<dynamic> products;
  final String searchText;

  HomeSearchClickedEvent(this.products, this.searchText);
}
