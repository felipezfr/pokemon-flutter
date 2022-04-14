import 'package:pokemon_felipe/models/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons();
}
