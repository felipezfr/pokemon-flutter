import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final int id;
  final String img;
  final String num;
  final List<String> type;

  Pokemon(
      {required this.name,
      required this.id,
      required this.img,
      required this.num,
      required this.type});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      img: json['img'],
      num: json['num'],
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
    );
  }

  Color? get baseColor {
    return _color(type: type[0]);
  }

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }

  // factory Pokemon.fromJson(Map<String, dynamic> json) {
  //   return Pokemon(
  //     json['id'],
  //     json['nome'],
  //     json['img'],
  //     json['num'],
  //     json['type'],
  //   );
  // }
}
