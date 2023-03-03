import 'package:flutter/material.dart';
import 'package:flutter_heads_or_tails/pages/home_page.dart';
import 'package:flutter_heads_or_tails/product/color/color_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yazı Tura',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: ProjectColor().elevatedButton,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
