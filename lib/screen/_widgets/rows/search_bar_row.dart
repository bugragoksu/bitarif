import 'package:flutter/material.dart';

import '../fields/search_field.dart';

class SearchBarRow extends StatelessWidget {
  final TextEditingController searchFieldController;
  final VoidCallback onEditingComplete;

  const SearchBarRow(
      {Key key,
      @required this.searchFieldController,
      @required this.onEditingComplete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: SearchField(
            onEditingComplete: onEditingComplete,
            controller: searchFieldController,
          ),
        ),
        // context.lowValue.toWidthSizedBox,
        // Expanded(
        //   flex: 1,
        //   child: FilterButton(),
        // ),
      ],
    );
  }
}
