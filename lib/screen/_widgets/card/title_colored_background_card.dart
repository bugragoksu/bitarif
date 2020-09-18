import 'package:bitarif/core/components/card/colored_background_card.dart';
import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TitleColoredBackgroundCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  const TitleColoredBackgroundCard(
      {Key key, @required this.title, this.isSelected, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ColoredBackGroundCard(
        bgColor: context.theme.colorScheme.primary.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: context.paddingNormal,
                child: Text(title,
                    style: TextStyle(
                        color: isSelected
                            ? context.theme.colorScheme.secondary
                            : context.theme.colorScheme.primary)))
          ],
        ),
      ),
    );
  }
}
