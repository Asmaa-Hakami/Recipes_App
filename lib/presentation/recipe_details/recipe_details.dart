import 'package:flutter/material.dart';
import 'package:recipes_app/core/constants/theme_constants.dart';
import 'package:recipes_app/presentation/shared_widgets/rating_score.dart';

import '../../core/constants/constants.dart';
import '../../models/hive_recipe.dart';

class RecipeDetails extends StatelessWidget {
  final HiveRecipe recipe;
  const RecipeDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Constants.mossGreen.shade50.withOpacity(0.05),
            image: DecorationImage(
              image: NetworkImage(recipe.image!),
              fit: BoxFit.cover,
            )),
        child: Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.07),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(64), right: Radius.circular(64)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name!,
                    style: AppStyle.titleGreen16,
                  ),
                  ratingScore((recipe.rating! * 10) / 2),
                  const SizedBox(height: 7),
                  Text(
                    "Ingredients",
                    style: AppStyle.titleBold14,
                  ),
                  ListView.builder(
                      //itemExtent: recipe.ingredients?.length.toDouble() ?? 20.0,
                      padding: EdgeInsets.zero,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recipe.ingredients?.length ?? 0,
                      itemBuilder: (context, index) {
                        List<String> ing = [];
                        (recipe.ingredients?[index]["components"].forEach(
                            (e) => ing.add(e?["raw_text"].toString() ?? "")));
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: ing.map((e) => infoText(e)).toList(),
                        );
                      }),
                  Text(
                    "Instructions",
                    style: AppStyle.titleBold14,
                  ),
                  ListView.builder(
                      // itemExtent:
                      //     (recipe.instructions?.length.toDouble() ?? 10) * 60,
                      padding: EdgeInsets.zero,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recipe.instructions?.length ?? 0,
                      itemBuilder: (context, index) {
                        List<String> instructions = [];
                        (recipe.instructions?[index]["display_text"]);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              instructions.map((e) => infoText(e)).toList(),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget infoText(String ingredient) {
    return Text(ingredient);
  }
}
