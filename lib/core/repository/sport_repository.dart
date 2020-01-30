
import 'package:sportbloc/core/models/sport_model.dart';
import 'package:sportbloc/core/services/sport_services.dart';

class SportRepository {
  SportServices services = new SportServices();
  
  Future<List<SportModel>> fetchPlayerByName(String name) 
      => services.fetchPlayerByName(name);
}