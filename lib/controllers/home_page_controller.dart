import 'package:flutter/material.dart';
import 'package:pokemon_felipe/models/pokemon.dart';
import 'package:pokemon_felipe/repositories/pokemon_repository.dart';

class HomePageController {
  final PokemonRepository _repository;

  HomePageController(this._repository) {
    fetch();
  }

  ValueNotifier<List<Pokemon?>> pokemons = ValueNotifier<List<Pokemon?>>([]);
  ValueNotifier<Pokemon?> pokemonSelected = ValueNotifier<Pokemon?>(null);

  fetch() async {
    final data = await _repository.getPokemons();

    pokemons.value = data;
  }
}
