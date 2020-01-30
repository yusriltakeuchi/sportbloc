import 'package:meta/meta.dart';

class SportModel {
  String name;
  String imageUrl;
  String clubName;
  String clubFlag;

  SportModel({
    @required this.name,
    @required this.imageUrl,
    @required this.clubName,
    @required this.clubFlag
  });

  factory SportModel.fromJson(Map<String, dynamic> json) {
    return SportModel(
      name: "${json['firstName']} ${json['lastName']}",
      imageUrl: json['headshot']['imgUrl'],
      clubName: json['club']['name'],
      clubFlag: json['club']['imageUrls']['light']['large']
    );
  }
}