import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class LowPaddingColumn extends StatelessWidget {
  final List<Widget> children;

  const LowPaddingColumn({Key key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
