part of 'sport_bloc.dart';

@immutable
abstract class SportEvent {}

class SearchTextChangedEvent extends SportEvent {
  final String searchName;

  SearchTextChangedEvent({
    @required this.searchName
  }) : assert(searchName != null);
}