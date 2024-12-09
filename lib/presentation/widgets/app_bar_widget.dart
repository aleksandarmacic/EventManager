import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;

  const AppBarWidget({
    Key? key,
    required this.title,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
