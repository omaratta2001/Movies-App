import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/Movie.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

final getdatapop = ChangeNotifierProvider<GetPopuler>((ref) => GetPopuler());

class GetPopuler extends ChangeNotifier {
  List<Movie>listDataModel = [];

  GetPopuler() {
    getData();
  }

  Future getData() async {
    listDataModel = [];
    listDataModel.clear();
    try {
      var Url = Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?api_key=9f4fc8f8532affd24ce0e64c7473a56e&language=en-US&page=1");

      var response = await http.get(Url);
      var responseBody = jsonDecode(response.body)["results"];
      for (int i = 0; i < responseBody.length; i++) {
        listDataModel.add(Movie.fromMap(responseBody[i]));
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
