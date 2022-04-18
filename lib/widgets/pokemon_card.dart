import 'package:flutter/material.dart';
import 'package:pokemon_felipe/models/pokemon.dart';
import 'package:pokemon_felipe/pages/detail_page.dart';
import 'package:pokemon_felipe/widgets/type_widget.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemonSelected,
    required this.pokemonList,
  }) : super(key: key);

  final Pokemon? pokemonSelected;
  final List<Pokemon?> pokemonList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(
                    pokemonSelected: pokemonSelected,
                    pokemonList: pokemonList,
                  )),
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: pokemonSelected!.baseColor?.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Positioned(
              top: 55,
              left: 45,
              child: SizedBox(
                height: 120,
                child: Image.network(
                  pokemonSelected!.image,
                  fit: BoxFit.contain,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(pokemonSelected!.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text('#${pokemonSelected!.num}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 3),
                  child: Column(
                    children: pokemonSelected!.type
                        .map((e) => TypeWidget(type: e))
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
