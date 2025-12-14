import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String text, {List<Widget>? actions}) {
  return AppBar(
    elevation: 3,
    shadowColor: const Color.fromRGBO(158, 158, 158, 1),
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Colors.white,
    title: Text(text, style: TextStyle(color: Colors.white)),
    actions: actions,
  );
}
