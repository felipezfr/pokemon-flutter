import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String num;
  final Color baseColor;
  final bool isOnTop;
  final AppBar appBar;
  const DetailAppBar({
    Key? key,
    required this.name,
    required this.num,
    required this.baseColor,
    required this.isOnTop,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isOnTop ? 0 : 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Text(
                '#$num',
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: baseColor,
      shadowColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 18,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
