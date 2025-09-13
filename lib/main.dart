import 'package:flutter/material.dart';
import 'package:my_first_flutter/views/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 8, 234, 42),
          brightness: Brightness.dark,
        ),
      ),
      home: WidgetTree(),
    );
  }
}
