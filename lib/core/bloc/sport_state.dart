part of 'sport_bloc.dart';

@immutable
abstract class SportState {}

class SportInitial extends SportState {}
class SportFetchingState extends SportState {}

class SportFetchedState extends SportState {
  final List<SportModel> sportData;
  SportFetchedState({@required this.sportData});
}

class SportErrorState extends SportState {}
class SportEmptyState extends SportState {}


