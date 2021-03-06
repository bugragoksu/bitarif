import 'dart:io';

import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class StackImageCard extends StatelessWidget {
  final String path;
  final bool isNetwork, isFile;
  final Widget child;
  final double height, width;
  final File imageFile;

  const StackImageCard(
      {Key key,
      @required this.path,
      @required this.isNetwork,
      this.height,
      this.width,
      @required this.child,
      this.isFile,
      this.imageFile})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: height ?? context.height / 2,
        width: width ?? double.infinity,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
                height: height ?? context.height / 2,
                width: width ?? double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: isNetwork
                            ? NetworkImage(path)
                            : isFile != null
                                ? FileImage(imageFile)
                                : AssetImage(path)))),
            child ?? Container(),
          ],
        ),
      ),
    );
  }
}
