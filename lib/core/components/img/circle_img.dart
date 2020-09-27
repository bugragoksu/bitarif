import 'package:flutter/material.dart';

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
          width: 100,
          height: 100,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: isNetwork ? NetworkImage(path) : AssetImage(path)))),
    );
  }
}
