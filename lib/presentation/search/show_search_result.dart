import 'package:flutter/cupertino.dart';
import '../shared_widgets/recipe_card.dart';

class ShowSearchResult extends StatelessWidget {
  final List<dynamic> recipes;
  const ShowSearchResult({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return RecipeCard(
          recipe: recipes[index],
        );
      },
    );
  }
}
