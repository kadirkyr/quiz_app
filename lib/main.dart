import 'package:flutter/material.dart';
import 'package:quiz_app/views/lobby_view.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          cardTheme: const CardTheme(color: Colors.deepOrange, margin: EdgeInsets.symmetric(horizontal: 20)),
          textTheme: const TextTheme(labelMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.deepOrange)),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: false,
              backgroundColor: Colors.deepOrange)),
      home: const LobbyView(),
    );
  }
}
