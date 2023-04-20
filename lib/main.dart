import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/constants/constants.dart';
import 'models/hive_recipe.dart';
import 'presentation/home.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter((HiveRecipeAdapter()));
  await Hive.openBox("favorite_recipes");
  await Hive.openBox("recipes");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.mossGreen,
        fontFamily: "Cairo",
      ),
      home: const HomePage(),
    );
  }
}
