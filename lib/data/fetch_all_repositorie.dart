import 'package:dio/dio.dart';
import 'package:pkmn_projct/data/fetch_all_pkm.dart';

class FetchAllRepository {
  final dio = Dio();
  final url = 'https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0';

  Future<AllPkmn> fetchAll() async {
    final response = await dio.get(url);
    final json = response.data;

    final allpkmn = AllPkmn.fromJson(json);

    return allpkmn;
  }
}
