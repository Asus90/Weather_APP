part of 'homebloc_bloc.dart';

class HomeblocEvent {}

class SearchWether extends HomeblocEvent {
  final String data;

  SearchWether({required this.data});
}

class SearchCurrentWether extends HomeblocEvent {
  SearchCurrentWether();
}
