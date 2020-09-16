import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../core/extensions/context_extension.dart';

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: context.mediumValue * 1.25,
        decoration: BoxDecoration(
            color: context.theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0)),
        child: IconButton(
            color: context.theme.colorScheme.primary,
            icon: Icon(FeatherIcons.filter),
            onPressed: () {}));
  }
}
