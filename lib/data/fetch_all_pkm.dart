import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

Future<AllPkmn> fetchAllPkm() async {
  final dio = Dio();
  const url2 = "https://pokeapi.co/api/v2/pokemon?limit=151";
  final response = await dio.get(url2);
  final json = jsonDecode(response.data.toString());
  final allpkm = AllPkmn.fromJson(json as Map<String, dynamic>);
  return allpkm;
}

class AllPkmn {
  int? count;
  String? next;
  Null previous;
  List<Results> results = [];

  AllPkmn({this.count, this.next, this.previous, this.results = const []});

  AllPkmn.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  String? url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
