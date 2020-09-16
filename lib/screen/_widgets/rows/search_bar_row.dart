import 'package:bitarif/screen/_widgets/buttons/filter_button.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/double_extension.dart';
import '../fields/search_field.dart';

class SearchBarRow extends StatelessWidget {
  final TextEditingController searchFieldController;

  const SearchBarRow({Key key, @required this.searchFieldController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: SearchField(
            controller: searchFieldController,
          ),
        ),
        context.lowValue.toWidthSizedBox,
        Expanded(
          flex: 1,
          child: FilterButton(),
        ),
      ],
    );
  }
}
