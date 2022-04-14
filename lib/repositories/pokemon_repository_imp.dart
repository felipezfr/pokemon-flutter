import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_felipe/models/pokemon.dart';
import 'package:pokemon_felipe/repositories/pokemon_repository.dart';
import 'package:pokemon_felipe/utils/api_utils.dart';

class PokemonRepositoryImp implements PokemonRepository {
  @override
  Future<List<Pokemon>> getPokemons() async {
    final response = await http.get(Uri.parse(API.apiBase));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao listar usando a API' + response.body.toString());
    }
  }
}
