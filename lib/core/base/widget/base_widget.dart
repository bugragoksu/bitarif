import 'package:flutter/material.dart';

import '../../components/column/low_padding_column.dart';

class BaseWidget extends StatelessWidget {
  final List<Widget> children;

  const BaseWidget({Key key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: double.infinity,
            child: SingleChildScrollView(
                child: LowPaddingColumn(
              children: children,
            ))),
      ),
    );
  }
}
