import '../../extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BodyColumn extends StatelessWidget {
  final List<Widget> children;

  const BodyColumn({Key key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Column(children: [...children]),
    );
  }
}
