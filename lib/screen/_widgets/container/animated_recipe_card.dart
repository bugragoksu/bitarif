import 'package:flutter/material.dart';

import '../../../core/components/container/animated_open_container.dart';
import '../../main/recipe/recipe_detail.dart/model/recipe_model.dart';
import '../../main/recipe/recipe_detail.dart/view/recipe_detail_view.dart';
import '../card/recipe_card.dart';

class AnimatedRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const AnimatedRecipeCard({Key key, @required this.recipe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedOpenContainer(
      closeWidget: RecipeCard(
        path: recipe.imageUrl,
        recipeId: recipe.id,
      ),
      openWidget: RecipeDetailView(recipe: recipe),
    );
  }
}
