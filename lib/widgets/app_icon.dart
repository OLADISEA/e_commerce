import 'package:e_commerce/utilities/dimensions.dart';
import 'package:flutter/cupertino.dart';

class AppIcons extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  const AppIcons({
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.size = 40,
    this.iconColor = const Color(0xFF756d54),
    this.iconSize = 16,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
    ),
      child: Icon(
        icon,
          color: iconColor,
          size: iconSize==16?Dimensions.font16:iconSize,
      ),
    );
  }
}
