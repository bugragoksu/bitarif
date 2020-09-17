import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../extensions/context_extension.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> list;
  final Function(String value) onChanged;
  final double width;

  const CustomDropdownButton(
      {Key key, @required this.list, @required this.onChanged, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mediumValue * 1.25,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: width ?? double.infinity,
      child: DropdownButton<String>(
        icon: Icon(FeatherIcons.chevronDown),
        isExpanded: true,
        items: this.list.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          this.onChanged(value);
        },
      ),
    );
  }
}
