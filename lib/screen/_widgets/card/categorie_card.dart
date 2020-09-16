import 'package:bitarif/core/constants/navigation/navigation_constants.dart';
import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:bitarif/core/init/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';

class CategorieCard extends StatelessWidget {
  final String url;

  const CategorieCard({Key key, @required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationManager.instance
            .navigateToPage(path: NavigationConstants.RECIPE_LIST_VIEW);
      },
      child: Container(
        decoration: BoxDecoration(
            color: context.theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0)),
        alignment: Alignment.center,
        child: Padding(
          padding: context.paddingNormal,
          child: Image.network(url),
        ),
      ),
    );
  }
}
