import 'package:flutter/material.dart';
import 'package:pokemon_felipe/controllers/home_page_controller.dart';
import 'package:pokemon_felipe/models/pokemon.dart';
import 'package:pokemon_felipe/pages/home/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final HomePageController _controller =
  //     HomePageController(PokemonRepositoryDioImp(
  //   DioServiceImp(),
  // ));

  @override
  Widget build(BuildContext context) {
    final _controller = context.read<HomePageController>();

    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        // shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<List<Pokemon?>>(
            valueListenable: _controller.pokemons,
            builder: (_, pokemons, __) {
              return pokemons != []
                  ? GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      children: pokemons
                          .map(
                            (e) => PokemonCard(
                              pokemon: e,
                            ),
                          )
                          .toList(),
                    )
                  : const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
