import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:squadio_PPL/domain/models/person.dart';
import 'package:squadio_PPL/domain/models/personDetails.dart';

import '../models/image.dart';

class ServerException implements Exception {
  String cause;
  ServerException(this.cause);
}

class PersonRemoteDataSource {
  late final http.Client client;
  final urlPerson = 'https://api.themoviedb.org/3/person';
  final apiKey = '?api_key=ee0bdef1938b5bb6591f3174077be49a';

  Future<List<Person>> getPopularPersons() async {
    final response = await client.get(Uri.parse(urlPerson + apiKey));
    print(response.body);
    if (response.statusCode == 200) {
      return Person.fromJson(json.decode(response.body)) as List<Person>;
    } else {
      print(response.body);
      throw ServerException(response.body);
    }
  }

  // @override
  // Future<PersonDetails> getPersonDetail(int id) async {
  //   final response = await client.get(Uri.parse(Urls.movieDetail(id)));

  //   if (response.statusCode == 200) {
  //     return MovieDetailResponse.fromJson(json.decode(response.body));
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<Image> getPersonImages(int id) async {
  //   final response = await client.get(Uri.parse(Urls.movieImages(id)));

  //   if (response.statusCode == 200) {
  //     return MediaImageModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
