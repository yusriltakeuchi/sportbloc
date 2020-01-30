import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportbloc/core/models/sport_model.dart';
import 'package:sportbloc/core/repository/sport_repository.dart';

part 'sport_event.dart';
part 'sport_state.dart';

class SportBloc extends Bloc<SportEvent, SportState> {

  final SportRepository sportRepository = new SportRepository();

  @override
  SportState get initialState => SportInitial();

  @override
  Stream<SportState> mapEventToState(SportEvent event) async* {
    //Fetching state
    yield SportFetchingState();
    
    //Inisialisasi data
    List<SportModel> sportData;
    try {
      //Jika event mencari data
      if (event is SearchTextChangedEvent) {
        if (event.searchName.isNotEmpty) {
          sportData = await sportRepository.fetchPlayerByName(event.searchName);

          //Jika data tidak ditemukan
          if (sportData.length == 0) {
            yield SportEmptyState();
          } else {
            yield SportFetchedState(sportData: sportData);
          }
        } else {
          yield SportInitial();
        }
      }
    } catch(e) {
      yield SportErrorState();
    }
  }

}
