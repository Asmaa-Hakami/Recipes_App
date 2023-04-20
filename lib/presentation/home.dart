import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/shared_widgets/app_bar.dart';
import '../core/constants/constants.dart';
import 'recipe_list/recipe_list_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MyAppBar(
        title: "Recipes",
        isFirst: true,
      ),
      body: Container(
          color: Constants.mossGreen.shade50.withOpacity(0.05),
          child: const RecipeListScreen()),
    );
  }
}
