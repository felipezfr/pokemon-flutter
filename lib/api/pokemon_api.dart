import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_felipe/models/pokemon.dart';

class PokemonAPI {
  static const _apiBase =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<Pokemon>> getPokemons() async {
    final response = await http.get(Uri.parse(_apiBase));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao listar usando a API' + response.body.toString());
    }
  }
}
