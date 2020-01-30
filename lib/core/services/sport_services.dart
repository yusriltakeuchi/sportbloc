
import 'package:sportbloc/core/models/sport_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class SportServices {
  String baseURL = "https://www.easports.com/fifa/ultimate-team/api/fut/item";
  final successCode = 200;
  Dio dio = new Dio();

  Future<List<SportModel>> fetchPlayerByName(String name) async {
    Response response = await dio.get("${baseURL}?name=$name");
    return parseResponse(response);
  }

  Future<List<SportModel>> parseResponse(Response response) async {
    if (response.statusCode == successCode) {

      var data = json.decode(response.toString())["items"];
      var _sportData = new List<SportModel>();

      await data.forEach((value) {
        SportModel _tempSport = SportModel.fromJson(value);
        bool isFound = false;

        //Mencari duplicate data
        for (var item in _sportData) {
          if (item.name == _tempSport.name) {
            isFound = true;
            break;
          }
        }

        if (isFound == false) {
          _sportData.add(_tempSport);
        }
      });

      return _sportData;
    } else {
      throw Exception('Failed load players');
    }
  }
}