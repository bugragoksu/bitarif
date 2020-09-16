import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String Function(String) validator;

  const SearchField({Key key, @required this.controller, this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          height: context.mediumValue * 1.25,
          decoration: BoxDecoration(
              color: context.theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0)),
          child: Theme(
            data: ThemeData(
                hintColor: context.theme.colorScheme.primary,
                primaryColor: context.theme.colorScheme.primary),
            child: TextFormField(
              controller: controller,
              cursorColor: context.theme.colorScheme.primary,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FeatherIcons.search,
                ),
                labelStyle: TextStyle(color: context.theme.colorScheme.primary),
                hintText: 'hungry'.locale + '?',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
