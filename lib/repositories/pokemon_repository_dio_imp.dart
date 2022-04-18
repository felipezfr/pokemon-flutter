import 'dart:convert';
import 'package:pokemon_felipe/models/pokemon.dart';
import 'package:pokemon_felipe/repositories/pokemon_repository.dart';
import 'package:pokemon_felipe/service/dio_service.dart';
import 'package:pokemon_felipe/utils/api_utils.dart';

class PokemonRepositoryDioImp implements PokemonRepository {
  final DioService _dioService;
  PokemonRepositoryDioImp(this._dioService);

  @override
  Future<List<Pokemon>> getPokemons() async {
    try {
      final result = await _dioService.getDio().get(API.apiBase);

      List json = jsonDecode(result.data)['pokemon'];

      var pokemonList = json
          .map(
            (e) => Pokemon.fromJson(e),
          )
          .toList();

      return pokemonList;
    } catch (e) {
      throw Exception("Erro ao buscar dados");
    }
  }
}
