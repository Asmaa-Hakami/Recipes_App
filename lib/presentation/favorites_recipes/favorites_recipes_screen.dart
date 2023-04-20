import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipes_app/core/service/recipe.api.dart';
import 'package:recipes_app/models/hive_recipe.dart';
import '../../core/constants/constants.dart';
import '../shared_widgets/app_bar.dart';
import '../shared_widgets/recipe_card.dart';

class FavoritesRecipesScreen extends ConsumerWidget {
  const FavoritesRecipesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favList = Hive.box('favorite_recipes');

    return Scaffold(
        appBar: const MyAppBar(
          title: "My Favorite Recipes",
          isFirst: false,
        ),
        body: Container(
            color: Constants.mossGreen.shade50.withOpacity(0.05),
            child: favList.isEmpty
                ? const Align(
                    alignment: Alignment.topCenter,
                    child: Text("There is no favorite recipe"))
                : ValueListenableBuilder(
                    valueListenable: favList.listenable(),
                    builder: (context, box, child) {
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            List<HiveRecipe> newList = RecipeApi
                                .recipesBox.values
                                .where(
                                    (element) => element.id == box.getAt(index))
                                .toList()
                                .cast();
                            return RecipeCard(recipe: newList[0]);
                          });
                    })));
  }
}
