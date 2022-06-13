import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokemon_felipe/controllers/home_page_controller.dart';
import 'package:pokemon_felipe/models/pokemon.dart';

class PokemonPageView extends StatefulWidget {
  final int pokemonSelectedId;
  const PokemonPageView({
    Key? key,
    required this.pokemonSelectedId,
  }) : super(key: key);

  @override
  State<PokemonPageView> createState() => PokemonPageViewState();
}

class PokemonPageViewState extends State<PokemonPageView> {
  late final PageController controllerPageView;

  // var currentPage = ValueNotifier<double?>(0.00);

  @override
  void initState() {
    super.initState();

    controllerPageView = PageController(
      viewportFraction: 0.5,
      initialPage: widget.pokemonSelectedId - 1,
    );
  }

  @override
  void dispose() {
    controllerPageView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = context.read<HomePageController>();

    controllerPageView.addListener(() {
      // currentPage.value = controllerPageView.page;
    });

    return ValueListenableBuilder<Pokemon?>(
      valueListenable: _controller.pokemonSelected,
      builder: (_, pokemonSelected, __) {
        return PageView.builder(
          controller: controllerPageView,
          onPageChanged: (index) {
            _controller.pokemonSelected.value =
                _controller.pokemons.value[index];
          },
          itemCount: _controller.pokemons.value.length,
          itemBuilder: ((context, page) {
            // print(page);
            final pokemon = _controller.pokemons.value[page];
            return Align(
              alignment: pokemon!.id == pokemonSelected!.id
                  ? Alignment.bottomCenter
                  : Alignment.center,
              child: Image.network(
                pokemon.image,
                width: pokemon.id == pokemonSelected.id ? 200 : 100,
                fit: BoxFit.contain,
                color: pokemon.id != pokemonSelected.id
                    ? Colors.black.withOpacity(0.4)
                    : null,
              ),
            );
          }),
        );

        // return PageView(
        //   controller: controllerPageView,
        //   padEnds: true,
        //   onPageChanged: (index) {
        //     _controller.pokemonSelected.value =
        //         _controller.pokemons.value[index];
        //   },
        //   children: _controller.pokemons.value.map(
        //     (e) {
        //       //   return Align(
        //       //     alignment: Alignment.bottomCenter,
        //       //     child: AnimatedOpacity(
        //       //       duration: const Duration(milliseconds: 200),
        //       //       opacity: e!.id != pokemonSelected!.id ? 0.4 : 1.0,
        //       //       child: TweenAnimationBuilder<double>(
        //       //           duration: const Duration(milliseconds: 2000),
        //       //           curve: Curves.easeIn,
        //       //           tween: Tween<double>(
        //       //             end: e.id != pokemonSelected.id ? 100 : 300,
        //       //             begin: e.id != pokemonSelected.id ? 300 : 100,
        //       //           ),
        //       //           builder: (context, value, child) {
        //       //             return Image.network(
        //       //               e.image,
        //       //               width: value,
        //       //               fit: BoxFit.contain,
        //       //               color: e.id != pokemonSelected.id
        //       //                   ? Colors.black.withOpacity(0.4)
        //       //                   : null,
        //       //             );
        //       //           }),
        //       //     ),
        //       //   );
        //       // }
        //       return Align(
        //         alignment: Alignment.center,
        //         child: ValueListenableBuilder<double?>(
        //           valueListenable: currentPage,
        //           builder: (_, currentPageValueValue, child) {
        //             double widthImage =
        //                 map(currentPageValueValue!, 0, 1, 200, 100);
        //             double widthNextImage =
        //                 map(currentPageValueValue, 0, 1, 100, 200);
        //             print(currentPageValueValue);
        //             print(e!.id);
        //             print(pokemonSelected!.id);
        //             if (e.id == pokemonSelected.id) {
        //               return SizedBox(
        //                 child: Image.network(
        //                   e.image,
        //                   fit: BoxFit.fitWidth,
        //                   width: widthImage,
        //                 ),
        //               );
        //             } else if (e.id == pokemonSelected.id + 1) {
        //               return SizedBox(
        //                 // height: 2,
        //                 // width: 100,
        //                 child: Image.network(
        //                   e.image,
        //                   color: Colors.black.withOpacity(0.4),
        //                   width: widthNextImage,

        //                   // fit: BoxFit.fill,
        //                 ),
        //               );
        //             } else {
        //               // return Container();
        //               return SizedBox(
        //                 // height: 2,
        //                 // width: 100,
        //                 child: Image.network(
        //                   e.image,
        //                   color: Colors.black.withOpacity(0.4),
        //                   width: 100,

        //                   // fit: BoxFit.fill,
        //                 ),
        //               );
        //             }
        //           },
        //         ),
        //       );
        //     },
        //   ).toList(),
        // );
      },
    );
  }
}
