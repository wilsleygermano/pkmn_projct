import 'package:pkmn_projct/data/fetch_all_pkm.dart';
import 'package:pkmn_projct/data/fetch_all_repositorie.dart';

class HomeController {
  AllPkmn allpkmns = AllPkmn(results: []);
  final repository = FetchAllRepository();
  HomeState state = HomeState.start;

  Future<void> start() async {
    print("oi");
    state = HomeState.loading;

      allpkmns = await repository.fetchAll();
      state = HomeState.success;

      state = HomeState.error;
    }
  }

enum HomeState { start, loading, success, error }
