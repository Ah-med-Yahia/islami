import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarUnselectedItem extends StatelessWidget {
  const NavBarUnselectedItem({super.key, required this.imageName});

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageName,
      height: 25,
      width: 25,
      fit: BoxFit.fill,
    );
  }
}
