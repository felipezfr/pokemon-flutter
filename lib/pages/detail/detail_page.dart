import 'package:flutter/material.dart';
import 'package:pokemon_felipe/pages/detail/widgets/detail_app_bar.dart';
import 'package:pokemon_felipe/pages/detail/widgets/detail_header.dart';
import 'package:pokemon_felipe/pages/detail/widgets/page_view.dart';
import 'package:provider/provider.dart';

import 'package:pokemon_felipe/controllers/home_page_controller.dart';
import 'package:pokemon_felipe/models/pokemon.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    // required this.pokemonSelected,
  }) : super(key: key);
  // final Pokemon? pokemonSelected;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  bool isOnTop = true;

  _scrollListener() {
    if (_scrollController.position.pixels > 37) {
      setState(() {
        isOnTop = false;
      });
    } else if (_scrollController.position.pixels <= 36) {
      setState(() {
        isOnTop = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _controller = context.read<HomePageController>();

    return ValueListenableBuilder<Pokemon?>(
      valueListenable: _controller.pokemonSelected,
      builder: (_, pokemonSelected, __) {
        return Scaffold(
          appBar: DetailAppBar(
            name: pokemonSelected!.name,
            num: pokemonSelected.num,
            baseColor: pokemonSelected.baseColor!,
            isOnTop: isOnTop,
            appBar: AppBar(),
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 270,
                      decoration: BoxDecoration(
                        color: pokemonSelected.baseColor,
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0.0, 220.0, 0.0),
                      height: 55,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      width: MediaQuery.of(context).size.width,
                      child: DetailHeader(
                        name: pokemonSelected.name,
                        num: pokemonSelected.num,
                        isOnTop: isOnTop,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: PokemonPageView(
                        pokemonSelectedId: pokemonSelected.id,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sobre",
                            style: TextStyle(color: pokemonSelected.baseColor),
                          ),
                          style: TextButton.styleFrom(
                            primary: pokemonSelected.baseColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Evolução",
                            style: TextStyle(color: pokemonSelected.baseColor),
                          ),
                          style: TextButton.styleFrom(
                            primary: pokemonSelected.baseColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Status",
                            style: TextStyle(color: pokemonSelected.baseColor),
                          ),
                          style: TextButton.styleFrom(
                            primary: pokemonSelected.baseColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Biologia",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  "Altura: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  pokemonSelected.height,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Row(
                              children: [
                                const Text(
                                  "Peso: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  pokemonSelected.weight,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
