import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/presentation/search/show_search_result.dart';
import '../../models/hive_recipe.dart';
import '../../core/service/recipe.api.dart';
import '../favorites_recipes/favorites_recipes_screen.dart';
import '../search/search_bar.dart';
import '../search/search_provider.dart';
import '../shared_widgets/recipe_card.dart';

Future<List<HiveRecipe>> getRecipes() async {
  return RecipeApi.getRecipes();
}

class RecipeListScreen extends ConsumerWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String searchText = ref.watch(searchProvider);

    return Column(
      children: [
        Row(
          children: [
            const SearchBar(),
            GestureDetector(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritesRecipesScreen()),
                    ),
                child: const Icon(Icons.favorite_border))
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
                child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: searchText == ""
                        ? RecipeApi.recipesBox.isEmpty
                            ? FutureBuilder(
                                future: getRecipes(),
                                builder: (BuildContext context, snapshot) {
                                  return snapshot.connectionState.name ==
                                          "waiting"
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : GridView.builder(
                                          physics: const ScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                          ),
                                          itemCount: snapshot.data?.length,
                                          itemBuilder: (context, index) {
                                            return RecipeCard(
                                                recipe: RecipeApi.recipesBox.get(
                                                    index) //snapshot.data![index],
                                                );
                                          });
                                })
                            : GridView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: RecipeApi.recipesBox.length,
                                itemBuilder: (context, index) {
                                  return RecipeCard(
                                      recipe: RecipeApi.recipesBox.get(index)
                                          as HiveRecipe //snapshot.data![index],
                                      );
                                })
                        : ShowSearchResult(
                            recipes: searchResult(searchText,
                                RecipeApi.recipesBox.values.toList()),
                          ))))
      ],
    );
  }
}

List<dynamic> searchResult(String interedText, List<dynamic> recipes) {
  return recipes
      .where((element) =>
          (element.name!.toLowerCase()).contains(interedText.toLowerCase()))
      .toList();
}
