import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  final String name;
  final String num;
  final bool isOnTop;
  const DetailHeader({
    Key? key,
    required this.name,
    required this.num,
    required this.isOnTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isOnTop ? 1 : 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          Text(
            '#$num',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
