import 'package:flutter/material.dart';
import 'package:quiz_app/views/view.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.deepOrange,
          cardTheme: const CardTheme(color: Colors.white, margin: EdgeInsets.symmetric(horizontal: 20)),
          textTheme: const TextTheme(
              labelMedium: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w600, fontSize: 20)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white)),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
          )),
      home: const ChoosingView(),
    );
  }
}
