import 'package:flutter/material.dart';
import 'package:pokemon_felipe/controllers/home_page_controller.dart';
import 'package:pokemon_felipe/pages/home/home_page.dart';
import 'package:pokemon_felipe/repositories/pokemon_repository.dart';
import 'package:pokemon_felipe/repositories/pokemon_repository_dio_imp.dart';
import 'package:pokemon_felipe/service/dio_service.dart';
import 'package:pokemon_felipe/service/dio_service_imp.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DioService>(create: (context) => DioServiceImp()),
        Provider<PokemonRepository>(
            create: (context) => PokemonRepositoryDioImp(context.read())),
        Provider<HomePageController>(
            create: (context) => HomePageController(context.read())),
      ],
      child: MaterialApp(
        title: 'Pokemon Felipe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const HomePage(title: 'Pokedex'),
      ),
    );
  }
}
