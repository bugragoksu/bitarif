import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../extensions/context_extension.dart';

class ImagedStartColumn extends StatelessWidget {
  final double height, width;
  final bool isNetwork;
  final String path;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;
  final List<Widget> children;

  const ImagedStartColumn(
      {Key key,
      this.height,
      this.width,
      @required this.isNetwork,
      @required this.path,
      this.icon,
      this.iconColor,
      this.onPressed,
      this.children})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: context.height / 2.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          isNetwork ? NetworkImage(path) : AssetImage(path))),
            ),
            Positioned(
              left: context.lowValue,
              top: context.lowValue,
              child: SafeArea(
                child: IconButton(
                  iconSize: context.mediumValue,
                  icon: Icon(icon ?? FeatherIcons.chevronLeft,
                      color: iconColor ?? context.theme.colorScheme.secondary),
                  onPressed: onPressed ?? () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
        ...children ?? []
      ],
    );
  }
}
