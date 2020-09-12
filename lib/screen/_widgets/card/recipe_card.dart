import 'package:flutter/material.dart';

import '../../../core/components/card/stack_image_card.dart';
import '../../../core/extensions/context_extension.dart';

class RecipeCard extends StatelessWidget {
  final String path;

  const RecipeCard({Key key, this.path}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StackImageCard(
      isNetwork: true,
      height: context.height / 4,
      width: context.width / 2,
      path: path,
      child: Positioned(
        left: 0,
        right: context.lowValue,
        bottom: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: context.theme.colorScheme.background,
              icon: Icon(Icons.favorite_border),
              iconSize: 18,
              onPressed: () {},
            ),
            Text("45 Min",
                style: TextStyle(color: context.theme.colorScheme.background))
          ],
        ),
      ),
    );
  }
}
