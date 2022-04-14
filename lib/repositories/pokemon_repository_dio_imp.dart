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

      var json = jsonDecode(result.data)['pokemon'];

      return json.map((e) => Pokemon.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Erro ao buscar dados");
    }

    // if (response.statusCode == 200) {
    //   final json = jsonDecode(response.body);
    //   final list = json['pokemon'] as List<dynamic>;
    //   return list.map((e) => Pokemon.fromJson(e)).toList();
    // } else {
    //   throw Exception('Erro ao listar usando a API' + response.body.toString());
    // }
  }
}
