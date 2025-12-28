import 'package:flutter/material.dart';

import 'pages/chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App with AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4169E1)),
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      home: ChatPage(),
    );
  }
}
