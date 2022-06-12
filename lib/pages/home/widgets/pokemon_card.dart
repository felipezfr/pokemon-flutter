import 'package:flutter/material.dart';
import 'package:pokemon_felipe/controllers/home_page_controller.dart';
import 'package:pokemon_felipe/models/pokemon.dart';
import 'package:pokemon_felipe/pages/detail/detail_page.dart';
import 'package:pokemon_felipe/widgets/type_widget.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon? pokemon;
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = context.read<HomePageController>();

    return GestureDetector(
      onTap: () {
        _controller.pokemonSelected.value = pokemon;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailPage(),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: pokemon!.baseColor?.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Positioned(
              top: 55,
              left: 45,
              child: SizedBox(
                height: 120,
                child: Image.network(
                  pokemon!.image,
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
                  child: Text(pokemon!.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text('#${pokemon!.num}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 3),
                  child: Column(
                    children:
                        pokemon!.type.map((e) => TypeWidget(type: e)).toList(),
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
