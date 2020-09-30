import 'package:flutter/material.dart';

import '../../../core/components/card/stack_image_card.dart';
import '../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/double_extension.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../main/recipe/recipe_detail.dart/model/recipe_model.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;

  const RecipeCard({
    Key key,
    @required this.recipe,
  }) : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StackImageCard(
          isNetwork: true,
          height: context.height / 4,
          width: context.width / 2,
          path: widget.recipe.imageUrl,
          child: Positioned(
            left: 0,
            right: context.lowValue,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: context.theme.colorScheme.background,
                  icon: Icon(isFav() ? Icons.favorite : Icons.favorite_border),
                  iconSize: 18,
                  onPressed: () {
                    setState(() {
                      isFav() ? delFavList() : addFavList();
                    });
                  },
                ),
                Text(widget.recipe.time,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.background))
              ],
            ),
          ),
        ),
        context.lowValue.toHeightSizedBox,
        Container(
          width: context.width / 2,
          child: Text(
            widget.recipe.title,
            overflow: TextOverflow.clip,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  String getFavList() {
    return LocaleManager.instance.getStringValue(PreferencesKeys.FAV_RECIPES);
  }

  void addFavList() {
    String favList = getFavList();
    favList += "${widget.recipe.id},";
    LocaleManager.instance.setStringValue(PreferencesKeys.FAV_RECIPES, favList);
  }

  void delFavList() {
    String favList = getFavList();
    String newFav = "";
    List<String> recipeIdList = favList.split(',');
    for (var i = 0; i < recipeIdList.length; i++) {
      if (!recipeIdList[i].contains(widget.recipe.id.toString())) {
        newFav += recipeIdList[i] + ",";
      }
    }
    LocaleManager.instance.setStringValue(PreferencesKeys.FAV_RECIPES, newFav);
  }

  bool isFav() {
    bool result = false;
    String favList = getFavList();

    List<String> recipeIdList = favList.split(',');
    for (var i = 0; i < recipeIdList.length; i++) {
      if (recipeIdList[i].contains(widget.recipe.id.toString())) {
        result = true;
        break;
      }
    }

    return result;
  }
}
