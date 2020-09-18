import 'package:flutter/material.dart';

import '../../../core/components/card/colored_background_card.dart';
import '../../../core/extensions/context_extension.dart';

class CategorieCard extends StatefulWidget {
  final String url;
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  const CategorieCard(
      {Key key,
      @required this.url,
      @required this.title,
      @required this.onPressed,
      this.isSelected})
      : super(key: key);

  @override
  _CategorieCardState createState() => _CategorieCardState();
}

class _CategorieCardState extends State<CategorieCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: ColoredBackGroundCard(
        bgColor: context.theme.colorScheme.primary.withOpacity(0.1),
        child: Column(
          children: [
            Padding(
              padding: context.paddingNormal,
              child: Image.network(
                widget.url,
                color: widget.isSelected != null
                    ? widget.isSelected
                        ? context.theme.colorScheme.secondary
                        : context.theme.colorScheme.primary
                    : context.theme.colorScheme.primary,
              ),
            ),
            Text(widget.title)
          ],
        ),
      ),
    );
  }
}
