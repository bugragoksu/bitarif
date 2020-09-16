import 'package:bitarif/core/extensions/double_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/components/card/stack_image_card.dart';
import '../../../core/extensions/context_extension.dart';

class RecipeCard extends StatelessWidget {
  final String path;
  final VoidCallback onPressed;

  const RecipeCard({Key key, @required this.path, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StackImageCard(
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
              'Apple granola with cinnamon',
              overflow: TextOverflow.clip,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
