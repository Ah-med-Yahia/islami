import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarUnselectedItem extends StatelessWidget {
  const NavBarUnselectedItem({super.key,required this.imageName});

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageName,
      height: 28,
      width: 28,
      fit: BoxFit.fill,
    );
  }
}
