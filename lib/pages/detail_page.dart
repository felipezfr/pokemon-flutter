import 'package:flutter/material.dart';
import 'package:pokemon_felipe/models/pokemon.dart';
import 'package:pokemon_felipe/widgets/page_view.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {Key? key, required this.pokemonSelected, required this.pokemonList})
      : super(key: key);
  final Pokemon pokemonSelected;
  final List<Pokemon> pokemonList;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemonSelected.name),
        backgroundColor: widget.pokemonSelected.baseColor,
        shadowColor: Colors.transparent,
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
                    color: widget.pokemonSelected.baseColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.pokemonSelected.name,
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            '#${widget.pokemonSelected.num}',
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
                          list: widget.pokemonList,
                          selected: widget.pokemonSelected,
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
  }
}
