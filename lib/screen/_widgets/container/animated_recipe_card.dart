import 'package:flutter/material.dart';

import '../../../core/components/container/animated_open_container.dart';
import '../../main/recipe_detail.dart/view/recipe_detail_view.dart';
import '../card/recipe_card.dart';

class AnimatedRecipeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpenContainer(
      closeWidget: RecipeCard(
        path:
            "https://anaffairfromtheheart.com/wp-content/uploads/2018/09/Fresh-Apple-Granola-in-a-bowl-735x980.jpg",
      ),
      openWidget: RecipeDetailView(
        title: "Apple granola with cinnamon",
        url:
            "https://anaffairfromtheheart.com/wp-content/uploads/2018/09/Fresh-Apple-Granola-in-a-bowl-735x980.jpg",
      ),
    );
  }
}
