import 'package:flowerapp/Components/Provider/DataFlow.dart';
import 'package:flowerapp/Page/Ceckout.dart';
import 'package:flowerapp/Page/Details.dart';
import 'package:flowerapp/Page/Home.dart';
import 'package:flowerapp/Page/Login.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'Page/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataFlow(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              // Set the background color to white
              backgroundColor: Colors.white,
              // Set the text and icon color to white
              textTheme: const TextTheme(
                  // Set text color
                  ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            home: Register()));
  }
}
