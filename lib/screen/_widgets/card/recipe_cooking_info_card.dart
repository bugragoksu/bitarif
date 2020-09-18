import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:bitarif/core/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RecipeCookingInfoCard extends StatelessWidget {
  final String cookingTime, serving, difficulty;

  const RecipeCookingInfoCard(
      {Key key,
      @required this.cookingTime,
      @required this.serving,
      @required this.difficulty})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
            padding: context.paddingNormal,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Icon(
                    FeatherIcons.users,
                    color: context.theme.colorScheme.secondary,
                  ),
                  context.lowValue.toWidthSizedBox,
                  Text(serving)
                ]),
                Row(children: [
                  Icon(
                    FeatherIcons.clock,
                    color: context.theme.colorScheme.secondary,
                  ),
                  context.lowValue.toWidthSizedBox,
                  Text(cookingTime,
                      style: TextStyle(fontSize: context.normalValue))
                ]),
                Row(children: [
                  Icon(
                    FeatherIcons.thermometer,
                    color: context.theme.colorScheme.secondary,
                  ),
                  context.lowValue.toWidthSizedBox,
                  Text(difficulty)
                ]),
              ],
            )));
  }
}
