import 'package:flutter/material.dart';
import 'package:pokemon_felipe/controllers/home_page_controller.dart';
import 'package:pokemon_felipe/models/pokemon.dart';
import 'package:pokemon_felipe/pages/detail/widgets/page_view.dart';
import 'package:provider/provider.dart';

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
  late ScrollController scrollController;

  late final PageController _controllerPageView;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    _controllerPageView = PageController(viewportFraction: 0.4);
  }

  @override
  Widget build(BuildContext context) {
    final _controller = context.read<HomePageController>();

    return ValueListenableBuilder<Pokemon?>(
        valueListenable: _controller.pokemonSelected,
        builder: (_, pokemonSelected, __) {
          return Scaffold(
            appBar: AppBar(
              title: Text(pokemonSelected!.name),
              backgroundColor: pokemonSelected.baseColor,
              shadowColor: Colors.transparent,
              elevation: 0,
              titleTextStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            body: SingleChildScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        decoration: BoxDecoration(
                          color: pokemonSelected.baseColor,
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  pokemonSelected.name,
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  '#${pokemonSelected.num}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Expanded(
                              child: PokemonPageView(
                                pokemonSelectedId: pokemonSelected.id,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
