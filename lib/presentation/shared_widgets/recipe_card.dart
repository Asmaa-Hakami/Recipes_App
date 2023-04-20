import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipes_app/core/constants/constants.dart';
import 'package:recipes_app/core/constants/theme_constants.dart';
import 'package:recipes_app/models/hive_recipe.dart';
import 'package:recipes_app/presentation/shared_widgets/rating_score.dart';
import '../recipe_details/recipe_details.dart';

class RecipeCard extends StatelessWidget {
  final HiveRecipe recipe;
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('favorite_recipes').listenable(),
        builder: (context, box, child) {
          final isFavorite = box.get(recipe.id) != null;
          return GestureDetector(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeDetails(
                              recipe: recipe,
                            )),
                  ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.005,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Constants.mossGreen.withOpacity(0.2),
                            offset: const Offset(
                              0.0,
                              2.0,
                            ),
                            spreadRadius: -2.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(recipe.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              recipe.name!,
                              style: AppStyle.titleBold14,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: GestureDetector(
                                  onTap: () async {
                                    isFavorite
                                        ? {
                                            await box.delete(recipe.id),
                                          }
                                        : {
                                            await box.put(recipe.id, recipe.id),
                                          };
                                  },
                                  child: isFavorite
                                      ? const Icon(Icons.favorite)
                                      : const Icon(Icons.favorite_border))),
                        ]),
                    ratingScore((recipe.rating! * 10) / 2)
                  ],
                ),
              ));
        });
  }
}
