import 'package:flutter/material.dart';

import '../../../core/components/card/stack_image_card.dart';
import '../../../core/extensions/context_extension.dart';

class CategorieRecipeCard extends StatelessWidget {
  final String path;
  final String category;
  final VoidCallback onPressed;

  const CategorieRecipeCard(
      {Key key, @required this.path, @required this.category, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: StackImageCard(
        isNetwork: true,
        height: context.height / 2,
        width: context.width / 2,
        path: path,
        child: Positioned(
          left: 0,
          bottom: context.normalValue,
          child: Container(
            width: context.width / 4,
            child: Center(
                child: Text(category,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ))),
            decoration: BoxDecoration(
                color: context.theme.colorScheme.background,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10))),
          ),
        ),
      ),
    );
  }
}
