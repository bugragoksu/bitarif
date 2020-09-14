import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class CircleImage extends StatelessWidget {
  final String path;
  final bool isNetwork;
  final VoidCallback onTap;

  const CircleImage(
      {Key key, @required this.path, @required this.isNetwork, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
          height: context.highValue * 1.5,
          width: context.highValue * 1.25,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: isNetwork ? NetworkImage(path) : AssetImage(path)))),
    );
  }
}
