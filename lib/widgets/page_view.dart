import 'package:flutter/material.dart';
import 'package:pokemon_felipe/models/pokemon.dart';

class PokemonPageView extends StatefulWidget {
  final Pokemon? selected;
  final List<Pokemon> list;

  const PokemonPageView({Key? key, required this.list, this.selected})
      : super(key: key);
  // final PageController controller;

  @override
  State<PokemonPageView> createState() => PokemonPageViewState();
}

class PokemonPageViewState extends State<PokemonPageView> {
  late PageController controller;
  late double selectedPokemon;

  @override
  void initState() {
    super.initState();
    selectedPokemon = widget.selected!.id.toDouble();
    controller = PageController(
        viewportFraction: 0.4, initialPage: selectedPokemon.toInt() - 1);
    controller.addListener(() {
      setState(() {
        selectedPokemon = controller.page!;
      });
      print(selectedPokemon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: widget.list.map(
        (e) {
          return e.id == selectedPokemon.round() + 1
              ? Image.network(
                  e.img,
                  fit: BoxFit.contain,
                )
              : SizedBox(
                  // height: 2,
                  child: Image.network(
                  e.img,
                  color: Colors.black45,
                  // fit: BoxFit.fill,
                ));
        },
      ).toList(),
    );
  }
}
